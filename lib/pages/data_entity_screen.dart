import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/resources/local_storage.dart';
import 'package:flutter_app/values/app_routes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';
import 'base_container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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

class DataEntityPage extends StatefulWidget {
  const DataEntityPage({super.key});
  
  @override
  State<DataEntityPage> createState() => _DataEntityPageState();
}

class _DataEntityPageState extends State<DataEntityPage> {
  final _formKey = GlobalKey<FormState>();

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
    final _controller = SidebarXController(selectedIndex: 0, extended: false);

    return BaseContainer(
        key: _formKey,
        title: "HAL",
        controller: _controller,
        child: body(context),
    );
  }
}

Stack body(BuildContext context) {
    return Stack(
    children: [
      Container(
                  margin: EdgeInsets.fromLTRB(65, 66, 0, 0),
                  color: Colors.blueGrey[50],
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: RichText(
                              text: TextSpan(
                                text: "Crea tu primera aplicación",
                                style: GoogleFonts.getFont(
                                  'Fredoka',
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.width  < 600 ? 18 : 25,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 40, 20, 0),
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: RichText(
                              text: TextSpan(
                                text: "Aplicaciones/Crear Aplicación",
                                style: GoogleFonts.getFont(
                                  'Fredoka',
                                  fontWeight: FontWeight.w400,
                                  fontSize: MediaQuery.of(context).size.width < 600 ? 13 : 18,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                ),
                 Container(
                  color: Colors.blueGrey[50],
                  margin: EdgeInsets.fromLTRB(65, 200, 0, 0),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: FutureBuilder(
                      future: getRequest(),
                      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Container(
                            child: const Center(
                              child: Text("Cargando ...")
                            ),
                          );
                        } else {
                          return GridView.builder(
                        itemCount: snapshot.data.length,
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 400,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 2.9 / 0.8),
                        itemBuilder: (ctx, index) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF000000)),
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Container(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Opacity(
                                        opacity: 0.3,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width < 400 ? 35 : 50,
                                          height: MediaQuery.of(context).size.height < 400 ? 35 : 50,
                                          child: SvgPicture.asset(
                                            'assets/vectors/gallery_1_x2.svg',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 2, 0, 4),
                                          child: TextButton.icon(
                                              onPressed: () => (Navigator.pushNamed(context, AppRoutes.data, arguments: {'idEntity': snapshot.data[index].id, 'tableName' : snapshot.data[index].name})),
                                              label: Text(snapshot.data[index].name),
                                              style: TextButton.styleFrom(
                                                  textStyle: GoogleFonts.getFont(
                                                        'Fredoka',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 20,
                                                      ),
                                                      foregroundColor: Color(0xFF000000)
                                              ),
                                            ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: RichText(
                                            text: TextSpan(
                                              text: "Lorem Ipsum",
                                              style: GoogleFonts.getFont(
                                                'Fredoka',
                                                fontWeight: FontWeight.w400,
                                                fontSize: MediaQuery.of(context).size.width < 600 ? 11 : 15,
                                                color: Color(0xFF000000),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                        }
                      },
                    ),                  
                  ),
                ),
    ]);
  }

List<ItemList> items = [
  ItemList(
      title: 'Crea una base de datos',
  ),
  ItemList(
      title: 'Usar un template',
  ),
  ItemList(
      title: 'Entidades',
  ),  
  ItemList(
      title: 'Datos',
  )
];

class ItemList {
  String? title;
  String? url;
  ItemList({this.title, this.url});
}

 Future<List<Entity>> getRequest() async {

      final List<Entity> entities = [];

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
              for (var singleEntity in responseData[0]) {
                Entity entity = Entity(
                    id: singleEntity["id"],
                    collectionName: singleEntity["collection_name"],
                    name: singleEntity["name"]
                );
                entities.add(entity);
              }
          }
          log('Login response: ${responseBody['message']}');
        } else {
          log('Login response: ${response.statusCode}');
        }

      } catch (e) {
        log('Exception: $e');
      }
      
      return entities;
  }

