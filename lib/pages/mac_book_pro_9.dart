import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/components/text_field_hal.dart';
import 'package:flutter_app/components/text_field_password_hal.dart';
import 'package:flutter_app/pages/login_screen.dart';
import 'package:flutter_app/values/app_routes.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class MacBookPro9 extends StatefulWidget {
  const MacBookPro9({super.key});

  @override
  State<MacBookPro9> createState() => _MacBookPro9State();
}

class _MacBookPro9State extends State<MacBookPro9> {
  dynamic _id;
  final _usernameController = TextEditingController();
  final _accountController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    bool setVisible = screenWidth < 650 ? false : true;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        width: screenWidth,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(40, 0, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 19, 0),
                      child: Opacity(
                        opacity: 0.3,
                        child: Container(
                          width: 70,
                          height: 70,
                          child: Container(
                            width: 70,
                            height: 70,
                            child: SvgPicture.asset(
                              'assets/vectors/gallery_14_x2.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Lorem Ipsum',
                          style: GoogleFonts.getFont(
                            'Roboto Condensed',
                            fontWeight: FontWeight.w700,
                            fontSize: screenWidth < 600 ? 25 : 40,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        height: screenHeigth * 0.85,
                        width: setVisible == true
                            ? screenWidth * 0.50
                            : screenWidth * 1,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(164, 191, 211, 219),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraint) {
                            return Stack(
                              children: [
                                Positioned(
                                  right: screenWidth < 800
                                      ? constraint.maxWidth * 0.10
                                      : constraint.maxWidth * 0.17,
                                  left: screenWidth < 800
                                      ? constraint.maxWidth * 0.10
                                      : constraint.maxWidth * 0.17,
                                  top: constraint.maxHeight * 0.07,
                                  bottom: constraint.maxHeight * 0.07,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(1, 95, 1, 50),
                                        child: Text(
                                          'Crea tu cuenta Gratis',
                                          style: GoogleFonts.getFont(
                                            'Fredoka',
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                screenWidth < 800 ? 20 : 23,
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(55, 0, 55, 25),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 15),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(0xFFD9D9D9)),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: Color(0xFFF4F4F4),
                                              ),
                                              child: Container(
                                                child: TextFieldHal(
                                                  controller:
                                                      _accountController,
                                                  name: "Mail",
                                                  width: screenWidth < 1350
                                                      ? 350 * 0.70
                                                      : 350 * 1,
                                                ),
                                              ),
                                            ),
                                            /*Container(
                                          margin:
                                              EdgeInsets.fromLTRB(13, 0, 13, 2),
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              'Ingresa tu nombre',
                                              style: GoogleFonts.getFont(
                                                'Fredoka',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Color(0xFF000000),
                                              ),
                                            ),
                                          ),
                                        ),*/
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(0xFFD9D9D9)),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: Color(0xFFFFFFFF),
                                              ),
                                              child: Container(
                                                child: TextFieldHal(
                                                  controller:
                                                      _usernameController,
                                                  name: "Ingresa tu nombre",
                                                  width: screenWidth < 1350
                                                      ? 350 * 0.70
                                                      : 350 * 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(55, 0, 55, 50),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  13, 0, 13, 2),
                                              child: const Align(
                                                alignment: Alignment.topCenter,
                                                /*child: Text(
                                              'Clave',
                                              style: GoogleFonts.getFont(
                                                'Fredoka',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Color(0xFF000000),
                                              ),
                                            ),*/
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Color(0xFFD9D9D9)),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                color: Color(0xFFFFFFFF),
                                              ),
                                              child: Container(
                                                child: TextFieldPasswordHal(
                                                  name: "Clave",
                                                  width: screenWidth < 1350
                                                      ? 350 * 0.70
                                                      : 350 * 1,
                                                  controller:
                                                      _passwordController,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                              ),
                                              onPressed: () {
                                                var result = createAccount();
                                                result.then((value) {
                                                  _accountController.clear();
                                                  _usernameController.clear();
                                                  _passwordController.clear();

                                                  final snackBar = SnackBar(
                                                    content: Text(
                                                        "Successfully created account"),
                                                    action: SnackBarAction(
                                                      label: "Thanks!",
                                                      onPressed: () {},
                                                    ),
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                });
                                              },
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Continuar',
                                                  style: GoogleFonts.getFont(
                                                    'Fredoka',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(0xFF000000),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                (Navigator.pushNamed(
                                                    context, AppRoutes.login)),
                                            child: Text(
                                              'Volver',
                                              style: GoogleFonts.getFont(
                                                'Fredoka',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: setVisible,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Container(
                          width: screenWidth * 0.50,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 200, 0, 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  child: Opacity(
                                    opacity: 0.3,
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        child: SvgPicture.asset(
                                          'assets/vectors/gallery_11_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Lorem Ipsum',
                                    style: GoogleFonts.getFont(
                                      'Roboto Condensed',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 40,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> createAccount() async {
    final url = Uri.parse("http://localhost:8000/account/");
    final name = _accountController.text;

    Map<String, dynamic> _body = {
      'name': name,
      'id_plan': '',
      'active': true,
      'database_name': name,
      'database_host': 'localhost',
    };

    String b = json.encode(_body);
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
        },
        body: b,
      );
      if (response.statusCode == 200) {
        log(response.body);
        final res = jsonDecode(response.body);
        setState(() {
          _id = res['data'][0]['id'];
        });
        createUser(name);
        return true;
      } else {
        log('Error al enviar los datos. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      log('Excepción al enviar los datos: $e');
    }
    return false;
  }

  void createUser(String nameAccount) async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final url = Uri.parse("http://localhost:8000/user/");
    Map<String, dynamic> _body = {
      'id_account': _id,
      'id_user_account_rol': '',
      'user': username,
      'password': password,
      'mail': '',
      'name': 'administrador',
      'last_name': '',
      'telephone': '',
      'lang': 'es',
      'time_zone': '',
      'token_firebase': '',
      'active': true
    };

    try {
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: jsonEncode(_body));
      if (response.statusCode == 200) {
        log('Datos enviados correctamente:');
        log(response.body);
        final resUser = jsonDecode(response.body);
        log(resUser.toString());
      } else {
        log('Error al enviar los datos. Código de estado: ${response.statusCode}');
        log(jsonEncode(_body));
      }
    } catch (e) {
      log('Excepción al enviar los datos: $e');
    }
  }
}
