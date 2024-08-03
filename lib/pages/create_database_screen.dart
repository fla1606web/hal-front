import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/values/app_routes.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/resources/local_storage.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EntityFieldHelper {
  final String? name;
  final String? type;
 
  EntityFieldHelper({
    this.name,
    this.type,
  });
} 

class Entity {
  final String? id;
  final String? collectionName;
  final String? name;
 
  Entity({
    this.id,
    this.collectionName,
    this.name,
  });
} 

class CreateDatabasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DatabaseCreatorPage(),
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

class DatabaseCreatorPage extends StatefulWidget {
  @override
  _DatabaseCreatorPageState createState() => _DatabaseCreatorPageState();
}

class _DatabaseCreatorPageState extends State<DatabaseCreatorPage> {
  final _formKey = GlobalKey<FormState>();
  final _databaseNameController = TextEditingController();
  List<Map<String, dynamic>> _fields = [];
  List<Entity> entities = [];
  List<String> entitiesMat = [];
  List<String> fieldsEntity = []; 
  List<String> listDefault = []; 
    
  bool visibleRelation = false;

  void _addField() {
    setState(() {
      _fields.add({
        'name': '',
        'type': 'Texto',
        'defaultValue': '',
        'required': false,
        'encrypted': false,
        'minChars': 0,
        'maxChars': 99,
        'specialChars': false,
        'relationActive': false,
        'relationFieldNameActive': false,
        'idEntityRelation': '',
        'nameEntityRelation': entitiesMat[0],
        'fieldNameEntityRelation': fieldsEntity[0],
        'fieldsEntityRelation': ['Seleccione un elemento'],
        'controller': TextEditingController()
      });
    });
  }

  void _removeField(int index) {
    setState(() {
      _fields.removeAt(index);
    });
  }

  void _resetForm() {
    setState(() {
      _databaseNameController.clear();
      _fields.clear();
    });
  }

  @override
  void dispose() {
    _databaseNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(
      BuildContext context, Map<String, dynamic> field) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        field['defaultValue'] = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Widget _buildFieldWidget(Map<String, dynamic> field, int index) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: Colors.blueGrey[50],
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            screenWidth < 1000 ? 5 : 140, 10, screenWidth < 1000 ? 5 : 95, 0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Ingresa un nombre',
                labelStyle: GoogleFonts.getFont('Fredoka'),
                border: OutlineInputBorder(),
              ),
              controller: field['controller'],
              onChanged: (value) {
                setState(() {
                  field['name'] = value;
                });
              },
              onTapOutside: (event) {
                  field['controller'].text = field['name'];
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: field['type'],
              items: ['Texto', 'Número', 'Fecha', 'Relacion'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.getFont('Fredoka'),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  field['type'] = newValue!;
                  field['defaultValue'] = ''; // Reset default value when type changes
                  if (newValue == 'Relacion') {
                      field['relationActive'] = true;
                  } else {
                    field['relationActive'] = false;
                  }
                });
              },
              decoration: InputDecoration(
                labelText: 'Tipo',
                labelStyle: GoogleFonts.getFont('Fredoka'),
                border: OutlineInputBorder(),
              ),
            ),
            Visibility(
              visible: field['relationActive'],
              child: SizedBox(height: 10)
            ),
            Visibility(
              visible: field['relationActive'],
              child: DropdownButtonFormField<String>(
              value: field['nameEntityRelation'],
              items: entitiesMat.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.getFont('Fredoka'),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                int selectedIndex = entitiesMat.indexWhere((option) => option == newValue);
                var result = loadFieldsEntity(entities[selectedIndex].id.toString());
                result.then((value) => {
                  if (value == true) {
                    setState(() {
                      field['relationFieldNameActive'] = true;
                      field['nameEntityRelation'] = newValue!;
                      field['idEntityRelation'] = entities[selectedIndex].id;
                      field['fieldsEntityRelation'].clear();
                      field['fieldsEntityRelation'].addAll(fieldsEntity);
                    })
                  }
                });
              },
              decoration: InputDecoration(
                labelText: 'Relacion',
                labelStyle: GoogleFonts.getFont('Fredoka'),
                border: OutlineInputBorder(),
              ),
            )       
            ),
            Visibility(
              visible: field['relationFieldNameActive'],
              child: SizedBox(height: 10)
            ),
            Visibility(
              visible: field['relationFieldNameActive'],
              child: DropdownSearch<String>(
              items: field['fieldsEntityRelation'],
              onChanged: (value) {
                setState(() {
                  field['fieldNameEntityRelation'] = value;  
                });                
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                    labelText: 'Seleccion campo a mostrar',
                    labelStyle: GoogleFonts.getFont('Fredoka'),
                    border: OutlineInputBorder(),
                ),
              )              
            ),    
            ),
            if (field['type'] == 'Fecha')
              ListTile(
                title: Text('Valor por defecto: ${field['defaultValue']}'),
                trailing: Icon(Icons.calendar_month_outlined),
                onTap: () => _selectDate(context, field),
              )
            else
              SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Valor por defecto',
                labelStyle: GoogleFonts.getFont('Fredoka'),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  field['defaultValue'] = value;
                });
              },
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text(
                'Requerido?',
                style: GoogleFonts.getFont('Fredoka'),
              ),
              value: field['required'],
              onChanged: (bool value) {
                setState(() {
                  field['required'] = value;
                });
              },
            ),
            ExpansionTile(
              title: Text(
                'Avanzado',
                style: GoogleFonts.getFont(
                  'Fredoka',
                ),
              ),
              children: [
                SwitchListTile(
                  title: Text(
                    'Encriptado?',
                    style: GoogleFonts.getFont('Fredoka'),
                  ),
                  value: field['encrypted'],
                  onChanged: (bool value) {
                    setState(() {
                      field['encrypted'] = value;
                    });
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Min. Caracteres',
                            labelStyle: GoogleFonts.getFont('Fredoka')),
                        keyboardType: TextInputType.number,
                        initialValue: field['minChars'].toString(),
                        onChanged: (value) {
                          setState(() {
                            field['minChars'] = int.tryParse(value) ?? 0;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Max. Caracteres',
                            labelStyle: GoogleFonts.getFont('Fredoka')),
                        keyboardType: TextInputType.number,
                        initialValue: field['maxChars'].toString(),
                        onChanged: (value) {
                          setState(() {
                            field['maxChars'] = int.tryParse(value) ?? 99;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SwitchListTile(
                  title: Text(
                    'Caracteres especiales?',
                    style: GoogleFonts.getFont(
                      'Fredoka',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF000000),
                    ),
                  ),
                  value: field['specialChars'],
                  onChanged: (bool value) {
                    setState(() {
                      field['specialChars'] = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(
                Icons.delete_forever_sharp,
                size: 18,
              ),
              onPressed: () => _removeField(index),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      vertical: 5, horizontal: screenWidth < 700 ? 28 : 40),
                  iconColor: Colors.black,
                  backgroundColor: Color.fromARGB(255, 255, 37, 37),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7))),
              label: Text(
                'Eliminar Campo',
                style: GoogleFonts.getFont(
                  'Fredoka',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    bool setVisible = screenWidth < 700 ? false : true;
    loadEntities();

    return Scaffold(
      body: Stack(
        children: [
                  Positioned(
                    top: 65,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      width: 65,
                      height: screenHeigth,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFB0A9A9)),
                        color: Color.fromARGB(255, 222, 219, 219),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 50, 10, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(2, 0, 0, 80),
                              width: 45,
                              height: 45,
                              child: IconButton(
                                iconSize: 72,
                                icon: SvgPicture.asset(
                                        'assets/vectors/home_5_x2.svg',
                                      ),
                                onPressed: () => (Navigator.pushNamed(context, AppRoutes.index)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(3, 0, 2, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFE4DEDE),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      child: SvgPicture.asset(
                                        'assets/vectors/element_41_x2.svg',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
                              width: 24,
                              height: 24,
                              child: Container(
                                width: 21.5,
                                height: 21.5,
                                child: SvgPicture.asset(
                                  'assets/vectors/vector_8_x2.svg',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(2, 0, 0, 80),
                              width: 24,
                              height: 24,
                              child: Container(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                  'assets/vectors/dcube_4_x2.svg',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              width: 24,
                              height: 24,
                              child: Container(
                                width: 20.9,
                                height: 21.5,
                                child: SvgPicture.asset(
                                  'assets/vectors/vector_41_x2.svg',
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              width: 24,
                              height: 24,
                              child: Container(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                  'assets/vectors/notification_3_x2.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 86, 133, 156)
                        ),
                        child: Container(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(26, 10, 30, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 6, 0, 9),
                                  child: Opacity(
                                    opacity: 0.3,
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        child: SvgPicture.asset(
                                          'assets/vectors/gallery_9_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE2DDDD),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(4, 8, 12.9, 9),
                                    child: Text(
                                      'GC',
                                      style: GoogleFonts.getFont(
                                        'Roboto Condensed',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
 
          Container(
            color: Colors.blueGrey[50],
            padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
            width: screenWidth < 700 ? screenWidth * 1 : screenWidth * 0.50,
            margin: EdgeInsets.fromLTRB(65, 66, 0, 0),
            child: Row(
              children: [
                Container(
                  child: Text(
                    "Crea tu primera Aplicación",
                    style: GoogleFonts.getFont(
                      'Fredoka',
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth < 700 ? 18 : 25,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blueGrey[50],
            width: screenWidth < 700 ? screenWidth * 1 : screenWidth * 0.50,
            margin: EdgeInsets.fromLTRB(65, 110, 0, 0),
            child: Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Text(
                    'Aplicaciones / Crear Aplicación / Crear Base de Datos',
                    style: GoogleFonts.getFont(
                      'Fredoka',
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth < 700 ? 12 : 15,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 55),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: screenWidth < 800 ? 0 : 5,
                        horizontal: screenWidth < 800 ? 10 : 90),
                    child: TextFormField(
                      controller: _databaseNameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre de la Base de Datos',
                        labelStyle: GoogleFonts.getFont('Fredoka'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        screenWidth < 800 ? 30 : 110, 10, 0, 10),
                    child: Text('Campos',
                        style: GoogleFonts.getFont(
                          'Fredoka',
                          fontSize: screenWidth < 700 ? 15 : 19,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            screenWidth < 800 ? 45 : 130, 5, 0, 5),
                        child: ElevatedButton.icon(
                          icon: Icon(
                            Icons.add_box_outlined,
                            size: 18,
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: screenWidth < 700 ? 28 : 40),
                              iconColor: Colors.black,
                              elevation: 5,
                              backgroundColor:
                                  Color.fromARGB(255, 123, 224, 76),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7))),
                          onPressed: _addField,
                          label: Text(
                            'Nuevo Campo',
                            style: GoogleFonts.getFont(
                              'Fredoka',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ..._fields
                      .asMap()
                      .entries
                      .map((entry) => _buildFieldWidget(entry.value, entry.key))
                      .toList(),
                ],
              ),
            ),
          ),
          Visibility(
            visible: setVisible,
            child: Positioned(
              width:
                  screenWidth < 925 ? screenWidth * 0.43 : screenWidth * 0.50,
              top: 65,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 130, 0, 0),
                height: screenHeigth,
                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Nombre de la Base de Datos',
                        style: GoogleFonts.getFont(
                          'Fredoka',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 25, 50),
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: SvgPicture.asset(
                          'assets/vectors/layer_5_x2.svg',
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Ingresa un nombre',
                      style: GoogleFonts.getFont(
                        'Fredoka',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xFF000000),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF000000)),
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xFFF6F6F6),
                      ),
                      child: Container(
                        width: 200,
                        height: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 123, 224, 76),
        onPressed: () {
          saveDatabase();
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Guardando base de datos...')),
            );
            //_resetForm();
          }
        },
        child: Text(
          "Guardar",
          style: GoogleFonts.getFont('Fredoka',
              color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Future<void> loadEntities() async {

    if (entities.isEmpty) {
      fieldsEntity.add('Seleccione un campo');
      listDefault.add('Seleccione un elemento');
      String idAccount = LocalStorage.getUserData("id_account");
      final url = Uri.parse('http://localhost:8000/entity/account/${idAccount}');
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
              Entity e = Entity(); entities.add(e);
              entitiesMat.add('Seleccione una entidad');
              for (var singleEntity in responseData[0]) {
                Entity entity = Entity(
                    id: singleEntity["id"],
                    collectionName: singleEntity["collection_name"],
                    name: singleEntity["name"]
                );
                entities.add(entity);
                entitiesMat.add(entity.name.toString());
              }
          }
          print('Login response: ${responseBody['message']}');
        } else {
          print('Login response: ${response.statusCode}');
        }
      } catch (e) {
        print('Exception: $e');
      }
    }
  }

  Future<bool> loadFieldsEntity(String idEntity) async {

      fieldsEntity.clear();
      fieldsEntity.add('Seleccione un campo');
      final url = Uri.parse('http://localhost:8000/entityField/entity/${idEntity}');
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
              var responseField = responseBody['data'];
              String rowFieldEntity = "";
              for (var singleEntity in responseField[0]) {
                rowFieldEntity = singleEntity["field_name"];

                fieldsEntity.add(rowFieldEntity);
              }
              return true;
          }
          print('Login response: ${responseBody['message']}');
        } else {
          print('Login response: ${response.statusCode}');
        }
      } catch (e) {
        print('Exception: $e');
      }
      
      return false;
  }

  Future<bool> saveDatabase() async {
    final url = Uri.parse("http://localhost:8000/entity/");
    bool? active = true;
    final collectionName = _databaseNameController.text;
    final idAccount = LocalStorage.getUserData("id_account");
    final name = _databaseNameController.text;

    Map<String, dynamic> _body = { 
          'active': active,
          'table_name': collectionName,
          'color': '#f3f3f3',
          'icon': 'fa-people',
          'id_account': idAccount,
          'roles': '',
          'name': name
    };
    String body = json.encode(_body);
    String token = LocalStorage.getUserData("token");
    try {
      var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }, 
        body: body
      );
      final res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (res['code'] == 200) {
          saveFields(res['data'][0]['id']);
          return true;
        } 
        print('Login response: ${res['message']}');
      } else {
        print('Login response: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    return false;
  } 
  
  void saveFields(idEntity) {
    String type = "";
    String idEntityRelation = "";
    String fieldNameEntityRelation = "";
    for (var field in _fields) {
      switch(field['type']) {
        case "Texto": type = "Alphanumeric";
        case "Número": type = "Numeric";
        case "Fecha": type = "Date";        
        case "Relacion": type = "Relation";
      }
      idEntityRelation = "";
      fieldNameEntityRelation = "";
      if (type == "Relation") {
        idEntityRelation = field['idEntityRelation'];
        fieldNameEntityRelation = field['fieldNameEntityRelation'];
      }
      saveField(idEntity, field['name'], type, idEntityRelation, fieldNameEntityRelation);
    }
  }

  Future<bool> saveField(idEntity, name, type, idEntityRelation, fieldNameEntityRelation) async {
    final url = Uri.parse("http://localhost:8000/entityField/");

    Map<String, dynamic> _body = { 
          'id_entity': idEntity,
          'name': name,
          'field_name': name,
          'id_entity_field_type': type,
          'id_entity_relation': idEntityRelation,
          'entity_relation_field_name': fieldNameEntityRelation,
          'required': 'true',
          'order': '0',
          'minimun': '0',
          'maximun': '0',
          'options': '',
          'roles': '',
          'active': true         
    };
    String body = json.encode(_body);
    String token = LocalStorage.getUserData("token");
    try {
      var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }, 
        body: body
      );
      final res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (res['code'] == 200) {

        }
        print('Login response: ${res['message']}');
        return true;
      } else {
        print('Login response: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    return false;
  }
}
