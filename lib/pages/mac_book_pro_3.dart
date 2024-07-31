import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class MacBookPro3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: SizedBox(
        width: 1440,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFB0A9A9)),
                  color: Color(0xFFF5F2F2),
                ),
                child: SizedBox(
                  width: 75,
                  height: 900,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(12, 0, 13, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(2, 0, 0, 27),
                          width: 24,
                          height: 24,
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/vectors/home_2_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(3, 0, 2, 28.3),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE4DEDE),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Container(
                              width: 45,
                              height: 45,
                              padding: EdgeInsets.fromLTRB(11, 10, 10, 11),
                              child: Container(
                                width: 24,
                                height: 24,
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: SvgPicture.asset(
                                    'assets/vectors/element_46_x2.svg',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(2, 0, 0, 28.3),
                          width: 24,
                          height: 24,
                          child: SizedBox(
                            width: 21.5,
                            height: 21.5,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_13_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(2, 0, 0, 307),
                          width: 24,
                          height: 24,
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/vectors/dcube_3_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 30.2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFBBB6B6),
                            ),
                            child: Container(
                              width: 50,
                              height: 0,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(1.4, 0, 0, 28.2),
                          width: 24,
                          height: 24,
                          child: SizedBox(
                            width: 20.9,
                            height: 21.5,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_26_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
                          width: 24,
                          height: 24,
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/vectors/notification_2_x2.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 1440,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: SizedBox(
                      width: 1440,
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
                                  child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: SvgPicture.asset(
                                      'assets/vectors/gallery_x2.svg',
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
                  Container(
                    margin: EdgeInsets.fromLTRB(75, 0, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F7F7),
                      ),
                      child: SizedBox(
                        width: 1365,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 583.3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(25, 0, 25, 19.9),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: SizedBox(
                                    width: 686.3,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(0, 0, 0, 22),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Crea tu primer aplicación',
                                                    style: GoogleFonts.getFont(
                                                      'Fredoka',
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 25,
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0, 0, 4.8, 0),
                                                    child: Text(
                                                      'Aplicaciones',
                                                      style: GoogleFonts.getFont(
                                                        'Fredoka',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 15,
                                                        color: Color(0xFF000000),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0, 0, 2.2, 0),
                                                    child: Text(
                                                      '/',
                                                      style: GoogleFonts.getFont(
                                                        'Fredoka',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 15,
                                                        color: Color(0xFF000000),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                                                    child: Text(
                                                      'Crear Aplicación',
                                                      style: GoogleFonts.getFont(
                                                        'Fredoka',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 15,
                                                        color: Color(0xFF000000),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0, 0, 2.2, 0),
                                                    child: Text(
                                                      '/',
                                                      style: GoogleFonts.getFont(
                                                        'Fredoka',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 15,
                                                        color: Color(0xFF000000),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Crear Base de Datos',
                                                    style: GoogleFonts.getFont(
                                                      'Fredoka',
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 15,
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 45, 0, 0),
                                          child: SizedBox(
                                            width: 208,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Color(0xFF000000)),
                                                    borderRadius: BorderRadius.circular(6),
                                                    color: Color(0xFFF9F7F7),
                                                  ),
                                                  child: Container(
                                                    width: 117,
                                                    padding: EdgeInsets.fromLTRB(0, 7, 0.2, 10),
                                                    child: Text(
                                                      'Guardar',
                                                      style: GoogleFonts.getFont(
                                                        'Fredoka',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 13,
                                                        color: Color(0xFF000000),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 7, 0, 10),
                                                  child: Text(
                                                    'Volver',
                                                    style: GoogleFonts.getFont(
                                                      'Fredoka',
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 13,
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 19.1),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE0DCDC),
                                    ),
                                    child: Container(
                                      width: 738,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(26, 0, 26, 0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: SizedBox(
                                    width: 551,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 0, 9.3),
                                          child: SizedBox(
                                            width: 551,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(0, 0.9, 11.9, 5.2),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: Color(0xFFD3CCCC),
                                                          borderRadius: BorderRadius.circular(6),
                                                        ),
                                                        child: Container(
                                                          width: 37.1,
                                                          height: 27.9,
                                                          padding: EdgeInsets.fromLTRB(7, 3.5, 6.1, 3.5),
                                                          child: Container(
                                                            width: 24,
                                                            height: 20.9,
                                                            child: SizedBox(
                                                              width: 24,
                                                              height: 20.9,
                                                              child: SvgPicture.asset(
                                                                'assets/vectors/layer_2_x2.svg',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: Color(0xFFD9D9D9)),
                                                        borderRadius: BorderRadius.circular(6),
                                                        color: Color(0xFFFFFFFF),
                                                      ),
                                                      child: Container(
                                                        width: 429,
                                                        padding: EdgeInsets.fromLTRB(14.7, 7, 14.7, 11),
                                                        child: Text(
                                                          'Nombre de la Base de Datos',
                                                          style: GoogleFonts.getFont(
                                                            'Fredoka',
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 13,
                                                            color: Color(0xFF000000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 4.4, 0, 8.7),
                                                  width: 24,
                                                  height: 20.9,
                                                  child: SizedBox(
                                                    width: 24,
                                                    height: 20.9,
                                                    child: SvgPicture.asset(
                                                      'assets/vectors/setting_51_x2.svg',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0, 0, 216, 0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0.7),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Campos',
                                                    style: GoogleFonts.getFont(
                                                      'Fredoka',
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 18,
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(0, 0, 15, 16),
                                                      child: SizedBox(
                                                        width: 15,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets.fromLTRB(0, 0, 14, 0.4),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Color(0xFF989292),
                                                                ),
                                                                child: Container(
                                                                  width: 25.3,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.fromLTRB(0.4, 0, 0, 0),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Color(0xFF989292),
                                                                ),
                                                                child: Container(
                                                                  width: 14.6,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(0, 8.7, 0, 0),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: Color(0xFF000000)),
                                                        borderRadius: BorderRadius.circular(6),
                                                        color: Color(0xFFFFFFFF),
                                                      ),
                                                      child: SizedBox(
                                                        width: 162,
                                                        child: Container(
                                                          padding: EdgeInsets.fromLTRB(13, 7, 0, 8.4),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(0, 2.6, 8, 0),
                                                                width: 16,
                                                                height: 16,
                                                                child: SizedBox(
                                                                  width: 16,
                                                                  height: 16,
                                                                  child: SvgPicture.asset(
                                                                    'assets/vectors/add_square_x2.svg',
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(0, 0, 0, 2.6),
                                                                child: Text(
                                                                  'Nuevo Campo',
                                                                  style: GoogleFonts.getFont(
                                                                    'Fredoka',
                                                                    fontWeight: FontWeight.w400,
                                                                    fontSize: 13,
                                                                    color: Color(0xFF000000),
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                ),
                child: SizedBox(
                  width: 627,
                  height: 900,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 24.7),
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
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 24.6, 0),
                        width: 60,
                        height: 60,
                        child: SizedBox(
                          width: 60,
                          height: 60,
                          child: SvgPicture.asset(
                            'assets/vectors/layer_x2.svg',
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
      ),
    );
  }
}