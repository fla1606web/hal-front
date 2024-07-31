import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MacBookPro2 extends StatefulWidget {
  @override
  State<MacBookPro2> createState() => _MacBookPro2State();
}

class _MacBookPro2State extends State<MacBookPro2> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
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
                color: Color.fromARGB(255, 123, 224, 76),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 50, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(2, 0, 0, 80),
                      width: 24,
                      height: 24,
                      child: Container(
                        width: 24,
                        height: 24,
                        child: SvgPicture.asset(
                          'assets/vectors/home_5_x2.svg',
                        ),
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
                  color: Color.fromARGB(255, 22, 85, 163),
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
                            fontSize: screenWidth < 600 ? 18 : 25,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 40, 150, 0),
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: RichText(
                        text: TextSpan(
                          text: "Aplicaciones",
                          style: GoogleFonts.getFont(
                            'Fredoka',
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth < 600 ? 13 : 18,
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
              child: GridView.builder(
                  itemCount: 2,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 400,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 2.9 / 0.8),
                  itemBuilder: (context, i) {
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
                                    width: screenWidth < 400 ? 35 : 50,
                                    height: screenWidth < 400 ? 35 : 50,
                                    child: SvgPicture.asset(
                                      'assets/vectors/gallery_1_x2.svg',
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(15, 2, 0, 4),
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Crear una aplicación',
                                        style: GoogleFonts.getFont(
                                          'Fredoka',
                                          fontWeight: FontWeight.w400,
                                          fontSize: screenWidth < 600 ? 13 : 18,
                                          color: Color(0xFF000000),
                                        ),
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
                                          fontSize: screenWidth < 600 ? 11 : 15,
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
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
