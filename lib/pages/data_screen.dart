import 'dart:convert';
import 'dart:developer';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/resources/local_storage.dart';
import 'package:flutter_app/values/app_routes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/pages/pluto_grid_popup.dart';
import 'package:sidebarx/sidebarx.dart';
import 'base_container.dart';
import 'package:http/http.dart' as http;
import 'package:pluto_grid/pluto_grid.dart';


class EntityFieldHelper {
  final String? name;
  final String? columnName;
  final String? type;
  final String? idEntityRelation;
  final List<String>? dataRelation;
 
  EntityFieldHelper({
    this.name,
    this.columnName,
    this.type,
    this.idEntityRelation,
    this.dataRelation
  });
} 

class DataPage extends StatefulWidget {
  const DataPage({super.key, this.idEntity, this.collectionName});

  final String? idEntity;
  final String? collectionName;
  
  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final _formKey = GlobalKey<FormState>();
  final List<PlutoColumn> columnsPluto = [];
  final List<PlutoColumnGroup> columnPlutoGroups = [];
  final List<PlutoRow> rowsPluto = [];

  late PlutoGridStateManager stateManager;

  void initializeControllers() {
  }

  void disposeControllers() {
  }

  void controllerListener() {
  }

  @override
  void initState() {
    initializeControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {   
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final idEntity = args["idEntity"];
    final tableName = args["tableName"];
   
    final _controller = SidebarXController(selectedIndex: 0, extended: false);

    return BaseContainer(
        key: _formKey,
        title: "HAL",
        controller: _controller,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getEntityFields(idEntity, tableName),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: const Center(
                    child: Text("Cargando ...")
                  ),
                );
              } else {
                for (var e in snapshot.data) {
                    PlutoColumnType pct = PlutoColumnType.text();
                    PlutoColumn p;
                    if (e.type == 'Numeric') { pct = PlutoColumnType.number(); }
                    if (e.type == 'Date') { pct = PlutoColumnType.date(); }

                    if (e.type == 'Relation') {
                      p = PlutoColumn(
                        title: e.name, 
                        field: e.columnName,
                        type:  PlutoColumnType.select(e.dataRelation)                   
                      );                  
                    } else {
                      p = PlutoColumn(
                        title: e.name, 
                        field: e.columnName,
                        type:  pct,
                      );
                    }

                    PlutoColumnGroup pg = PlutoColumnGroup(title: e.name, fields: ['$e.name'], expandedColumn: true);

                    columnsPluto.add(p);
                    columnPlutoGroups.add(pg);
                }

                return  Container(
                    padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: PlutoGrid(
                      columns: columnsPluto,
                      rows: rowsPluto,
                      columnGroups: columnPlutoGroups,
                      onLoaded: (PlutoGridOnLoadedEvent event) {
                        stateManager = event.stateManager;
                        stateManager.setShowColumnFilter(true);
                      },
                      onRowChecked: (event){ print(event);},
                      onChanged: (PlutoGridOnChangedEvent event) {
                        print(event);
                      },
                      configuration: const PlutoGridConfiguration(),
                      createHeader: (stateManager) => _Header(stateManager: stateManager, collectionName: tableName),
                    ),
                  );
              }
            },
          ),
      ),
    );
  }
  

  Future<List<EntityFieldHelper>> getEntityFields(String idEntity, String collectionName) async {

      final url = Uri.parse('http://localhost:8000/entityField/entity/${idEntity}');
      String token = LocalStorage.getUserData("token");
      final List<EntityFieldHelper> entityFieldsHelper = [];
      try {          
        final response = await http.get(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
        );
        
        if (response.statusCode == 200) {
          var responseBody = json.decode(response.body);
          if (responseBody['code'] == 200) {
              var responseField = responseBody['data'];
              EntityFieldHelper entityFieldHelperId = EntityFieldHelper(
                    name: 'id',
                    columnName: 'id',
                    type: 'Alphanumeric'
              );
              entityFieldsHelper.add(entityFieldHelperId);
              for (var singleEntity in responseField[0]) {
                EntityFieldHelper entityFieldHelper = EntityFieldHelper(
                    name: singleEntity["name"],
                    columnName: singleEntity["field_name"],
                    type: singleEntity["id_entity_field_type"],
                    idEntityRelation: singleEntity["id_entity_relation"],
                    dataRelation: await getEntityFieldsRelation(singleEntity["id_entity_relation"], singleEntity['entity_relation_field_name'])
                );
                entityFieldsHelper.add(entityFieldHelper);
              }

              if (entityFieldsHelper.isNotEmpty) {

                String idAccount = LocalStorage.getUserData("id_account");
                final url = Uri.parse('http://localhost:8000/data/${idAccount}/${collectionName}');
          
                final response_ = await http.get(url,
                  headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    'Authorization': 'Bearer $token',
                  }
                );
                  
                if (response_.statusCode == 200) {
                  var responseBody_ = json.decode(response_.body);
                  if (responseBody_['code'] == 200) {
                      var responseData = responseBody_['data'];  
                      for (var singleData in responseData) {
                        String rowDataHelper = "";
                        var singleIdData = singleData['_id'].toString();
                        rowDataHelper = '"id":"' +  singleIdData.substring(7, singleIdData.length - 1) + '",';                        
                        for (var singleField in responseField[0]) {
                          var nameField = singleField["field_name"].toString();
                          try {
                            if (singleField['id_entity_relation'].trim() != "") {
                                String idRegisterEntityRelation = singleData[nameField];
                                EntityFieldHelper objetoEncontrado = entityFieldsHelper.firstWhere((entry) => entry.columnName == nameField);                                
                                if (objetoEncontrado.dataRelation!.length > 0) {
                                  int indice = objetoEncontrado.dataRelation!.indexWhere((element) => element.contains(idRegisterEntityRelation));
                                  String dataRegisterEntityRelation = objetoEncontrado.dataRelation![indice];
                                  rowDataHelper += '"' + nameField + '":"'+ dataRegisterEntityRelation + '",';                                  
                                } else {
                                  rowDataHelper += '"' + nameField + '":"",';  
                                }
                            } else {
                                rowDataHelper += '"' + nameField + '":"'+ singleData[nameField] + '",';
                            }
                          } catch (e) {
                            rowDataHelper += '"' + nameField + '":"",';
                          }
                        }
                        rowDataHelper = rowDataHelper.substring(0, rowDataHelper.length-1);
                        rowDataHelper = "{" + rowDataHelper + "}";
                        final rowData = jsonDecode(rowDataHelper) as Map<String, dynamic>;  
                        rowsPluto.add(PlutoRow.fromJson(rowData));
                      }
                      
                    }
                  }
               }              
          }
          log('Login response: ${responseBody['message']}');
        } else {
          log('Login response: ${response.statusCode}');
        }
      } catch (e) {
        log('Exception: $e');
      }
      
      return entityFieldsHelper;
  }

  Future<List<String>> getEntityFieldsRelation(String idEntityRelation, String fieldNameEntityRelation) async {

    List<String> dataEntityRelation = [];

    if (idEntityRelation != "") {
      // Obtener el nombre de la entidad a partir de su id
      String nameEntityRelation = await getNameEntityRelation(idEntityRelation);

      // obtener los datos de la entidad para luego armar la lista desplegable
      dataEntityRelation = await getDataEntityRelation(nameEntityRelation, fieldNameEntityRelation);
    }

    return dataEntityRelation;
  }

  Future<String> getNameEntityRelation(String idEntityRelation) async {

      final url = Uri.parse('http://localhost:8000/entity/${idEntityRelation}');
      String token = LocalStorage.getUserData("token");
      try {          
        final response = await http.get(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
        );
    
        if (response.statusCode == 200) {
          var responseBody = json.decode(response.body);
          if (responseBody['code'] == 200) {
              var responseData = responseBody['data'];
              var singleEntity = responseData[0];
              var nameEntityRelation = singleEntity['table_name'];

              return nameEntityRelation;
          }
          log('Login response: ${responseBody['message']}');
        } else {
          log('Login response: ${response.statusCode}');
        }

      } catch (e) {
        log('Exception: $e');
      }
      
      return "";
  }

 Future<List<String>> getDataEntityRelation(String nameEntityRelation, String fieldNameEntityRelation) async {

      List<String> data = [];
      String idAccount = LocalStorage.getUserData("id_account");
      String token = LocalStorage.getUserData("token");
      final url = Uri.parse('http://localhost:8000/data/${idAccount}/${nameEntityRelation}');
      try {          
        final response = await http.get(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }
        );
    
        if (response.statusCode == 200) {
                  var responseBody = json.decode(response.body);
                  if (responseBody['code'] == 200) {
                      var responseData = responseBody['data'];  
                      for (var singleData in responseData) {
                        String rowDataHelper = "";

                        var singleIdData = singleData['_id'].toString();
                        rowDataHelper = singleData[fieldNameEntityRelation].toString().trim();
                        rowDataHelper = rowDataHelper.padRight(100 - rowDataHelper.length);
                        rowDataHelper += 'idRegisterEntityRelation:' +  singleIdData.substring(7, singleIdData.length - 1); 

                        data.add(rowDataHelper);
                      }
                      return data;
                    }
        }
      } catch (e) {
        log('Exception: $e');
      }
      
      return data;
  }  

}


class _Header extends StatefulWidget {
  const _Header({
    required this.stateManager,
    required this.collectionName,
    Key? key,
  }) : super(key: key);

  final PlutoGridStateManager stateManager;
  final String collectionName;

  @override
  State<_Header> createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  final faker = Faker();

  int addCount = 1;

  int addedCount = 0;

  PlutoGridSelectingMode gridSelectingMode = PlutoGridSelectingMode.row;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.stateManager.setSelectingMode(gridSelectingMode);
    });
  }

  void handleAddColumns() {
    final List<PlutoColumn> addedColumns = [];

    for (var i = 0; i < addCount; i += 1) {
      addedColumns.add(
        PlutoColumn(
          title: faker.food.cuisine(),
          field: 'column${++addedCount}',
          type: PlutoColumnType.text(),
        ),
      );
    }

    widget.stateManager.insertColumns(
      widget.stateManager.bodyColumns.length,
      addedColumns,
    );
  }

  void handleAddRows() {
    final newRows = widget.stateManager.getNewRows(count: addCount);

    widget.stateManager.appendRows(newRows);

    widget.stateManager.setCurrentCell(
      newRows.first.cells.entries.first.value,
      widget.stateManager.refRows.length - 1,
    );

    widget.stateManager.moveScrollByRow(
      PlutoMoveDirection.down,
      widget.stateManager.refRows.length - 2,
    );

    widget.stateManager.setKeepFocus(true);
  }

  void handleSaveAll() {
    widget.stateManager.setShowLoading(true);
    String idData = "";
    String rowHelper = "";
    int exitsIdRegisterEntityRelation = 0;

    Future.delayed(const Duration(milliseconds: 500), () {
      for (var row in widget.stateManager.refRows) {
        rowHelper = "";
        row.cells.forEach((k,v) {
            if (k.toString()!='id') {
              exitsIdRegisterEntityRelation = v.value.toString().indexOf('idRegisterEntityRelation');
              if (exitsIdRegisterEntityRelation > 0) {
                rowHelper += '"' + k.toString() + '":"' + v.value.toString().substring(exitsIdRegisterEntityRelation + 25) + '",';
              } else {
                rowHelper += '"' + k.toString() + '":"' + v.value.toString() + '",';
              }
            } else {
              idData = v.value.toString();
            }
        });
        rowHelper = rowHelper.substring(0, rowHelper.length-1);
        rowHelper = "{" + rowHelper + "}";

        saveData(idData, rowHelper);
      }

      widget.stateManager.setShowLoading(false);
    });
  }

  void saveData(String idData, String row) async {

    String idAccount = LocalStorage.getUserData("id_account");
    String token = LocalStorage.getUserData("token");
    String collectionName = widget.collectionName;
    final url;
    if (idData.isNotEmpty) {
        url = Uri.parse("http://localhost:8000/data/${idAccount}/${collectionName}/${idData}");
      
        try {
          var response = await http.put(url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }, 
            body: row
          );
          final res = jsonDecode(response.body);
          if (response.statusCode == 200) {
            if (res['code'] == 200) {

            }
            log('Login response: ${res['message']}');
          } else {
            log('Login response: ${response.statusCode}');
          }
      } catch (e) {
        log('Exception: $e');
      }

    } else {
      url = Uri.parse("http://localhost:8000/data/${idAccount}/${collectionName}/");

      try {
          var response = await http.post(url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }, 
            body: row
          );
          final res = jsonDecode(response.body);
          if (response.statusCode == 200) {
            if (res['code'] == 200) {

            }
            log('Login response: ${res['message']}');
          } else {
            log('Login response: ${response.statusCode}');
          }
      } catch (e) {
        log('Exception: $e');
      }      
    }
  }

  void handleRemoveCurrentColumnButton() {
    final currentColumn = widget.stateManager.currentColumn;

    if (currentColumn == null) {
      return;
    }

    widget.stateManager.removeColumns([currentColumn]);
  }

  void handleRemoveCurrentRowButton() async {
    String idAccount = LocalStorage.getUserData("id_account");
    String token = LocalStorage.getUserData("token");
    String collectionName = widget.collectionName;

    PlutoRow? row = widget.stateManager.currentRow;
    String idData = row!.cells['id']!.value.toString();

    final url = Uri.parse("http://localhost:8000/data/${idAccount}/${collectionName}/${idData}");

    try {
          var response = await http.delete(url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }
          );
          final res = jsonDecode(response.body);
          if (response.statusCode == 200) {
            if (res['code'] == 200) {
              widget.stateManager.removeCurrentRow();
            }
            log('Login response: ${res['message']}');
          } else {
            log('Login response: ${response.statusCode}');
          }
    } catch (e) {
      log('Exception: $e');
    }          
  }

  void handleRemoveSelectedRowsButton() {
    widget.stateManager.removeRows(widget.stateManager.currentSelectingRows);
  }

  void handleFiltering() {
    widget.stateManager
        .setShowColumnFilter(!widget.stateManager.showColumnFilter);
  }

  void setGridSelectingMode(PlutoGridSelectingMode? mode) {
    if (mode == null || gridSelectingMode == mode) {
      return;
    }

    setState(() {
      gridSelectingMode = mode;
      widget.stateManager.setSelectingMode(mode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton(
                value: addCount,
                items:
                    [1, 5, 10, 50, 100].map<DropdownMenuItem<int>>((int count) {
                  final color = addCount == count ? Colors.blue : null;

                  return DropdownMenuItem<int>(
                    value: count,
                    child: Text(
                      count.toString(),
                      style: TextStyle(color: color),
                    ),
                  );
                }).toList(),
                onChanged: (int? count) {
                  setState(() {
                    addCount = count ?? 1;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: handleAddColumns,
              child: const Text('Add columns'),
            ),
            ElevatedButton(
              onPressed: handleAddRows,
              child: const Text('Add rows'),
            ),
            ElevatedButton(
              onPressed: handleSaveAll,
              child: const Text('Save all'),
            ),
            ElevatedButton(
              onPressed: handleRemoveCurrentColumnButton,
              child: const Text('Remove Current Column'),
            ),
            ElevatedButton(
              onPressed: handleRemoveCurrentRowButton,
              child: const Text('Remove Current Row'),
            ),
            ElevatedButton(
              onPressed: handleRemoveSelectedRowsButton,
              child: const Text('Remove Selected Rows'),
            ),
            ElevatedButton(
              onPressed: handleFiltering,
              child: const Text('Toggle filtering'),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                value: gridSelectingMode,
                items: PlutoGridSelectingMode.values
                    .map<DropdownMenuItem<PlutoGridSelectingMode>>(
                        (PlutoGridSelectingMode item) {
                  final color = gridSelectingMode == item ? Colors.blue : null;

                  return DropdownMenuItem<PlutoGridSelectingMode>(
                    value: item,
                    child: Text(
                      item.name,
                      style: TextStyle(color: color),
                    ),
                  );
                }).toList(),
                onChanged: (PlutoGridSelectingMode? mode) {
                  setGridSelectingMode(mode);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}