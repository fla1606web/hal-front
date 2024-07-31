import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MacBookPro7 extends StatefulWidget {
  @override
  State<MacBookPro7> createState() => _MacBookPro7State();
}

class _MacBookPro7State extends State<MacBookPro7> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Container(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFB0A9A9)),
                  color: Color(0xFFF5F2F2),
                ),
                child: Container(
                  width: 75,
                  height: 900,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(12, 0, 13, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
                          width: 24,
                          height: 24,
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/vectors/home_x2.svg',
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
                                    'assets/vectors/element_43_x2.svg',
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
                          child: Container(
                            width: 21.5,
                            height: 21.5,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_x2.svg',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(2, 0, 0, 307),
                          width: 24,
                          height: 24,
                          child: Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/vectors/dcube_x2.svg',
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
                          child: Container(
                            width: 20.9,
                            height: 21.5,
                            child: SvgPicture.asset(
                              'assets/vectors/vector_6_x2.svg',
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
                              'assets/vectors/notification_5_x2.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Container(
                      width: screenWidth,
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
                                      'assets/vectors/gallery_16_x2.svg',
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
                      width: screenWidth,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF9F7F7),
                            ),
                            child: SizedBox(
                              width: 1365,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(25, 30, 30, 192),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 33.7, 45),
                                      child: SizedBox(
                                        width: 1276.3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 6),
                                                  child: Text(
                                                    'Agenda de contactos',
                                                    style: GoogleFonts.getFont(
                                                      'Fredoka',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 25,
                                                      color: Color(0xFF000000),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      1, 0, 1, 0),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      'Lorem Ipsum',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Fredoka',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xFF000000),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 15, 0, 6),
                                              child: SizedBox(
                                                width: 208,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xFF000000)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        color:
                                                            Color(0xFFF9F7F7),
                                                      ),
                                                      child: Container(
                                                        width: 117,
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 7, 0.2, 10),
                                                        child: Text(
                                                          'Guardar',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Fredoka',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF000000),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 7, 0, 10),
                                                      child: Text(
                                                        'Volver',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Fredoka',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 13,
                                                          color:
                                                              Color(0xFF000000),
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
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFFFFF),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: SizedBox(
                                        width: 1310,
                                        child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(3, 4, 11, 17),
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                left: 0,
                                                right: 0,
                                                top: 83,
                                                child: Container(
                                                  width: 1296,
                                                  height: 34,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            Color(0xFFD6D1D1)),
                                                  ),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            53, 9, 0, 9),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 0, 8, 0),
                                                          child: SizedBox(
                                                            width: 43,
                                                            child: Text(
                                                              'Gabriel',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Fredoka',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                color: Color(
                                                                    0xFF9F9898),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          '06/12/1984',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Fredoka',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF9F9898),
                                                          ),
                                                        ),
                                                        Text(
                                                          'gabriel@gmail.com',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Fredoka',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF9F9898),
                                                          ),
                                                        ),
                                                        Text(
                                                          '1234567890',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Fredoka',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF9F9898),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 6.6,
                                                top: 122,
                                                child: Container(
                                                  width: 1296,
                                                  height: 34,
                                                  child: Container(
                                                    width: 19,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color(
                                                              0xFF848080)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 6.6,
                                                top: 157,
                                                child: Container(
                                                  width: 1296,
                                                  height: 34,
                                                  child: Container(
                                                    width: 19,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color(
                                                              0xFF848080)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 1296,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              33, 0, 33, 16),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: SizedBox(
                                                          width: 1047,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        1,
                                                                        0),
                                                                width: 221,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color(
                                                                          0xFF848080)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          8,
                                                                          10,
                                                                          8),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            1,
                                                                            8,
                                                                            1),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              47,
                                                                          child:
                                                                              Text(
                                                                            'Nombre',
                                                                            style:
                                                                                GoogleFonts.getFont(
                                                                              'Fredoka',
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 13,
                                                                              color: Color(0xFF000000),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            64,
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              margin: EdgeInsets.fromLTRB(0, 4.5, 7.5, 2.5),
                                                                              child: SizedBox(
                                                                                width: 16,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(
                                                                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 2.3),
                                                                                      child: SizedBox(
                                                                                        width: 13,
                                                                                        height: 1,
                                                                                        child: SvgPicture.asset(
                                                                                          'assets/vectors/vector_45_x2.svg',
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      margin: EdgeInsets.fromLTRB(0, 0, 5.7, 2.3),
                                                                                      child: SizedBox(
                                                                                        width: 7.3,
                                                                                        height: 1,
                                                                                        child: SvgPicture.asset(
                                                                                          'assets/vectors/vector_16_x2.svg',
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 2.3),
                                                                                      child: SizedBox(
                                                                                        width: 13,
                                                                                        height: 1,
                                                                                        child: SvgPicture.asset(
                                                                                          'assets/vectors/vector_58_x2.svg',
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      margin: EdgeInsets.fromLTRB(0, 0, 5.7, 0),
                                                                                      child: SizedBox(
                                                                                        width: 7.3,
                                                                                        height: 1,
                                                                                        child: SvgPicture.asset(
                                                                                          'assets/vectors/vector_33_x2.svg',
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                                                              width: 18,
                                                                              height: 18,
                                                                              child: SizedBox(
                                                                                width: 18,
                                                                                height: 18,
                                                                                child: SvgPicture.asset(
                                                                                  'assets/vectors/text_3_x2.svg',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 18,
                                                                              height: 18,
                                                                              child: SvgPicture.asset(
                                                                                'assets/vectors/group_1114_x2.svg',
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        2,
                                                                        0),
                                                                width: 351,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color(
                                                                          0xFF848080)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          6,
                                                                          6,
                                                                          10.7),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            1.3),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              232,
                                                                          child:
                                                                              Text(
                                                                            'Fecha de nacimiento',
                                                                            style:
                                                                                GoogleFonts.getFont(
                                                                              'Fredoka',
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 13,
                                                                              color: Color(0xFF000000),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              64,
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                margin: EdgeInsets.fromLTRB(0, 3.3, 7.5, 1.8),
                                                                                child: SizedBox(
                                                                                  width: 16,
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 1.7),
                                                                                        child: SizedBox(
                                                                                          width: 13,
                                                                                          height: 0.7,
                                                                                          child: SvgPicture.asset(
                                                                                            'assets/vectors/vector_34_x2.svg',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(0, 0, 5.7, 1.7),
                                                                                        child: SizedBox(
                                                                                          width: 7.3,
                                                                                          height: 0.7,
                                                                                          child: SvgPicture.asset(
                                                                                            'assets/vectors/vector_42_x2.svg',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 1.7),
                                                                                        child: SizedBox(
                                                                                          width: 13,
                                                                                          height: 0.7,
                                                                                          child: SvgPicture.asset(
                                                                                            'assets/vectors/vector_37_x2.svg',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(0, 0, 5.7, 0),
                                                                                        child: SizedBox(
                                                                                          width: 7.3,
                                                                                          height: 0.7,
                                                                                          child: SvgPicture.asset(
                                                                                            'assets/vectors/vector_48_x2.svg',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                                                                width: 18,
                                                                                height: 13.3,
                                                                                child: SizedBox(
                                                                                  width: 18,
                                                                                  height: 13.3,
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/vectors/calendar_1_x2.svg',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 18,
                                                                                height: 13.3,
                                                                                child: SvgPicture.asset(
                                                                                  'assets/vectors/group_1112_x2.svg',
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
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        2,
                                                                        0),
                                                                width: 254,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color(
                                                                          0xFF848080)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          6,
                                                                          9,
                                                                          10),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            2),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              48,
                                                                          child:
                                                                              Text(
                                                                            'Mail',
                                                                            style:
                                                                                GoogleFonts.getFont(
                                                                              'Fredoka',
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 13,
                                                                              color: Color(0xFF000000),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              64,
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                margin: EdgeInsets.fromLTRB(0, 3.3, 7.5, 2.6),
                                                                                child: SizedBox(
                                                                                  width: 16,
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 1.7),
                                                                                        child: SizedBox(
                                                                                          width: 13,
                                                                                          height: 0.7,
                                                                                          child: SvgPicture.asset(
                                                                                            'assets/vectors/vector_22_x2.svg',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(0, 0, 5.7, 1.7),
                                                                                        child: SizedBox(
                                                                                          width: 7.3,
                                                                                          height: 0.7,
                                                                                          child: SvgPicture.asset(
                                                                                            'assets/vectors/vector_11_x2.svg',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 1.7),
                                                                                        child: SizedBox(
                                                                                          width: 13,
                                                                                          height: 0.7,
                                                                                          child: SvgPicture.asset(
                                                                                            'assets/vectors/vector_25_x2.svg',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(0, 0, 5.7, 0),
                                                                                        child: SizedBox(
                                                                                          width: 7.3,
                                                                                          height: 0.7,
                                                                                          child: SvgPicture.asset(
                                                                                            'assets/vectors/vector_31_x2.svg',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                margin: EdgeInsets.fromLTRB(0, 0.7, 6, 0),
                                                                                width: 18,
                                                                                height: 13.3,
                                                                                child: SizedBox(
                                                                                  width: 18,
                                                                                  height: 13.3,
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/vectors/sms_x2.svg',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0.7),
                                                                                child: SizedBox(
                                                                                  width: 18,
                                                                                  height: 13.3,
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/vectors/group_1113_x2.svg',
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
                                                              Container(
                                                                width: 216,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color(
                                                                          0xFF848080)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          5.9,
                                                                          4,
                                                                          11.1),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            1),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              98,
                                                                          child:
                                                                              Text(
                                                                            'Teléfono',
                                                                            style:
                                                                                GoogleFonts.getFont(
                                                                              'Fredoka',
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 13,
                                                                              color: Color(0xFF000000),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            3.7,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              64,
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                margin: EdgeInsets.fromLTRB(0, 2.6, 7.5, 2.6),
                                                                                child: SizedBox(
                                                                                  width: 16,
                                                                                  child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 1.7),
                                                                                        child: SizedBox(
                                                                                          width: 13,
                                                                                          height: 0.7,
                                                                                          child: SvgPicture.asset(
                                                                                            'assets/vectors/vector_24_x2.svg',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(0, 0, 5.7, 1.7),
                                                                                        child: SizedBox(
                                                                                          width: 7.3,
                                                                                          height: 0.7,
                                                                                          child: SvgPicture.asset(
                                                                                            'assets/vectors/vector_53_x2.svg',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 1.7),
                                                                                        child: SizedBox(
                                                                                          width: 13,
                                                                                          height: 0.7,
                                                                                          child: SvgPicture.asset(
                                                                                            'assets/vectors/vector_10_x2.svg',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        margin: EdgeInsets.fromLTRB(0, 0, 5.7, 0),
                                                                                        child: SizedBox(
                                                                                          width: 7.3,
                                                                                          height: 0.7,
                                                                                          child: SvgPicture.asset(
                                                                                            'assets/vectors/vector_52_x2.svg',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                                                                                width: 18,
                                                                                height: 13.3,
                                                                                child: SizedBox(
                                                                                  width: 18,
                                                                                  height: 13.3,
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/vectors/quote_up_square_x2.svg',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 18,
                                                                                height: 13.3,
                                                                                child: SvgPicture.asset(
                                                                                  'assets/vectors/group_1111_x2.svg',
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 5),
                                                      child: SizedBox(
                                                        width: 1296,
                                                        child: Stack(
                                                          children: [
                                                            Positioned(
                                                              left: 6.6,
                                                              bottom: 7,
                                                              child: Container(
                                                                width: 19,
                                                                height: 20,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color(
                                                                          0xFF848080)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 1296,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Color(
                                                                        0xFFD6D1D1)),
                                                              ),
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            53,
                                                                            10,
                                                                            0,
                                                                            8),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            43,
                                                                        child:
                                                                            Text(
                                                                          'Gabriel',
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Fredoka',
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Color(0xFF9F9898),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '06/12/1984',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Fredoka',
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            13,
                                                                        color: Color(
                                                                            0xFF9F9898),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'gabriel@gmail.com',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Fredoka',
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            13,
                                                                        color: Color(
                                                                            0xFF9F9898),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '1234567890',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Fredoka',
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            13,
                                                                        color: Color(
                                                                            0xFF9F9898),
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
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              6.6, 0, 6.6, 7),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Container(
                                                          width: 19,
                                                          height: 20,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: Color(
                                                                    0xFF848080)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 7),
                                                      child: SizedBox(
                                                        width: 1296,
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 0, 0, 33),
                                                          child: Stack(
                                                            clipBehavior:
                                                                Clip.none,
                                                            children: [
                                                              Container(
                                                                width: 1296,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Color(
                                                                          0xFFD6D1D1)),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          53,
                                                                          7,
                                                                          0,
                                                                          11),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              43,
                                                                          child:
                                                                              Text(
                                                                            'Gabriel',
                                                                            style:
                                                                                GoogleFonts.getFont(
                                                                              'Fredoka',
                                                                              fontWeight: FontWeight.w400,
                                                                              fontSize: 13,
                                                                              color: Color(0xFF9F9898),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '06/12/1984',
                                                                        style: GoogleFonts
                                                                            .getFont(
                                                                          'Fredoka',
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          fontSize:
                                                                              13,
                                                                          color:
                                                                              Color(0xFF9F9898),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'gabriel@gmail.com',
                                                                        style: GoogleFonts
                                                                            .getFont(
                                                                          'Fredoka',
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          fontSize:
                                                                              13,
                                                                          color:
                                                                              Color(0xFF9F9898),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '1234567890',
                                                                        style: GoogleFonts
                                                                            .getFont(
                                                                          'Fredoka',
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          fontSize:
                                                                              13,
                                                                          color:
                                                                              Color(0xFF9F9898),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 0,
                                                                right: 0,
                                                                bottom: 0,
                                                                child:
                                                                    Container(
                                                                  width: 1296,
                                                                  height: 34,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Color(
                                                                            0xFFD6D1D1)),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            53,
                                                                            8,
                                                                            0,
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          margin: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                43,
                                                                            child:
                                                                                Text(
                                                                              'Gabriel',
                                                                              style: GoogleFonts.getFont(
                                                                                'Fredoka',
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 13,
                                                                                color: Color(0xFF9F9898),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          '06/12/1984',
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Fredoka',
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Color(0xFF9F9898),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'gabriel@gmail.com',
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Fredoka',
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Color(0xFF9F9898),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          '1234567890',
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Fredoka',
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Color(0xFF9F9898),
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
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              6.6, 0, 6.6, 278),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Container(
                                                          width: 1296,
                                                          height: 34,
                                                          child: Container(
                                                            width: 19,
                                                            height: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: Color(
                                                                      0xFF848080)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              7, 0, 0, 0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFD9D9D9),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                        ),
                                                        child: Container(
                                                          width: 1289,
                                                          height: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                right: 0,
                                                top: 182,
                                                child: Container(
                                                  width: 1296,
                                                  height: 34,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            Color(0xFFD6D1D1)),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 254.3,
                                                top: 51,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF848080),
                                                  ),
                                                  child: Container(
                                                    width: 165,
                                                    height: 0,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                right: 213.5,
                                                top: 50,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF848080),
                                                  ),
                                                  child: Container(
                                                    width: 166,
                                                    height: 0,
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
                            ),
                          ),
                          Positioned(
                            left: 61.3,
                            top: 183,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF848080),
                              ),
                              child: Container(
                                width: 166,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 634.1,
                            top: 184,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF848080),
                              ),
                              child: Container(
                                width: 165,
                                height: 0,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 473,
                            top: 183,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF848080),
                              ),
                              child: Container(
                                width: 166,
                                height: 0,
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
          ],
        ),
      ),
    );
  }
}
