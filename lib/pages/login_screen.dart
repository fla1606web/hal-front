import 'package:flutter/material.dart';

import 'package:flutter_app/components/text_field_hal.dart';
import 'package:flutter_app/components/text_field_password_hal.dart';
import 'package:flutter_app/resources/local_storage.dart';
import 'package:flutter_app/values/app_routes.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  dynamic _id;
  final _usernameController = TextEditingController();
  final _accountController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    bool setVisible = screenWidth < 650 ? false : true;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: screenWidth,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 31, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: screenHeigth * 0.80,
                      width: setVisible == true
                          ? screenWidth * 0.50
                          : screenWidth * 1,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 86, 133, 156),
                      ),
                      child: LayoutBuilder(builder: (context, constraint) {
                        return Stack(
                          children: [
                            Positioned(
                              right: constraint.maxWidth * 0.05,
                              left: constraint.maxWidth * 0.05,
                              top: constraint.maxHeight * 0.1,
                              bottom: constraint.maxHeight * 0.1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[50],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Container(
                                  width: screenWidth,
                                  height: screenHeigth * 0.65,
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                    child: Text(
                                      'Inicio de sesión',
                                      style: GoogleFonts.getFont(
                                        'Fredoka',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 23,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                    child: Container(
                                      child: TextFieldHal(
                                          controller: _usernameController,
                                          name: "Usuario",
                                          width: constraint.maxWidth * 0.5),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                    child: Container(
                                      child: TextFieldPasswordHal(
                                        controller: _passwordController,
                                        name: "Password",
                                        width: constraint.maxWidth * 0.5,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                    child: Container(
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 11, 0.7, 12),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(
                                                  constraint.maxWidth * 0.5,
                                                  40.0), // Tamaño mínimo deseado
                                            ),
                                            onPressed: () {
                                              var result = sendRequest();
                                              result.then((value) {
                                                if (value == true) {
                                                  _usernameController.clear();
                                                  _passwordController.clear();

                                                  Navigator.pushNamed(
                                                      context, AppRoutes.index);
                                                } else {
                                                  final snackBar = SnackBar(
                                                    content: const Text(
                                                        "Error login"),
                                                    action: SnackBarAction(
                                                      label: "Thanks!",
                                                      onPressed: () {},
                                                    ),
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                }
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
                                            )),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: SizedBox(
                                      width: 253,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 0, 20),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFF000000),
                                              ),
                                              child: Container(
                                                width: 83,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'o',
                                            style: GoogleFonts.getFont(
                                              'Fredoka',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 8, 0, 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFF000000),
                                              ),
                                              child: Container(
                                                width: 83,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFD9D9D9)),
                                      borderRadius: BorderRadius.circular(6),
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    child: Container(
                                      width: 343,
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(6, 5, 0, 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 16, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                      'assets/images/image_3.png',
                                                    ),
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 31,
                                                  height: 29,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 6, 0, 7),
                                              child: Text(
                                                'Continuar con Google',
                                                style: GoogleFonts.getFont(
                                                  'Fredoka',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: constraint.maxWidth -
                                        (2 * constraint.maxWidth * 0.05),
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        text:
                                            'Al crear una cuenta, aceptas los ',
                                        style: GoogleFonts.getFont(
                                          'Fredoka',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Color(0xFF000000),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Términos de servicio',
                                            style: GoogleFonts.getFont(
                                              'Fredoka',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              decoration:
                                                  TextDecoration.underline,
                                              height: 1.3,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' y la ',
                                          ),
                                          TextSpan(
                                            text: 'Política de privacidad',
                                            style: GoogleFonts.getFont(
                                              'Fredoka',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              decoration:
                                                  TextDecoration.underline,
                                              height: 1.3,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '.',
                                            style: GoogleFonts.getFont(
                                              'Fredoka',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Color(0xFF000000),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                            text: TextSpan(
                                                text:
                                                    '¿Todavía no tenés una cuenta? ',
                                                style: GoogleFonts.getFont(
                                                  'Fredoka',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                  color: Color(0xFF000000),
                                                ))),
                                        TextButton.icon(
                                          onPressed: () => (Navigator.pushNamed(
                                              context, AppRoutes.register)),
                                          label:
                                              const Text('Creala desde aquí'),
                                          style: TextButton.styleFrom(
                                              textStyle: GoogleFonts.getFont(
                                            'Fredoka',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Color(0xFF000000),
                                          )),
                                        )
                                      ]),
                                ],
                              ),
                            ),
                          ],
                        );
                      })),
                  Visibility(
                    visible: setVisible,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Container(
                        width: screenWidth * 0.50,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 70),
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
                                  'Lorem ipsum dolor sit amet',
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(50, 0, 50, 10),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Lorem ipsum dolor sit amet consectetur. Sed commodo molestie tortor ac. Feugiat.',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    'Roboto Condensed',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 25,
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
    );
  }

  Future<bool> sendRequest() async {
    final url = Uri.parse("http://localhost:8000/login/");
    final username = _usernameController.text;
    final password = _passwordController.text;

    Map<String, dynamic> _body = {
      'username': username,
      'password': password,
    };

    String body = json.encode(_body);
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: body,
      );
      final res = json.decode(response.body);
      if (response.statusCode == 200) {
        if (res['code'] == 200) {
          var data = json.decode(res['data'][0]);
          LocalStorage.saveUserData("id_account", data['id_account']);
          LocalStorage.saveUserData("token", data['token']);
          return true;
        } else {}
        log('Login response: ${res['message']}');
      } else {
        log('Login response: ${response.statusCode}');
      }
    } catch (e) {
      log('Exception: $e');
    }
    return false;
  }
}

class ScreenArguments {
  final String title;
  final Widget customWidget;

  ScreenArguments(this.title, this.customWidget);
}
