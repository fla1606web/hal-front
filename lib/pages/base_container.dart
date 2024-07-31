import 'dart:convert';
import 'dart:developer';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/resources/local_storage.dart';
import 'package:flutter_app/values/app_routes.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../routes.dart';
import '../values/app_theme.dart';
import 'package:http/http.dart' as http;
import 'package:pluto_grid/pluto_grid.dart';


class BaseContainer extends StatelessWidget {
  final String title;
  final Widget child;

  BaseContainer({
    Key? key,
    required this.title,
    required SidebarXController controller,
    required this.child,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppTheme.primaryColor,
        canvasColor: AppTheme.canvasColor,
        scaffoldBackgroundColor: AppTheme.scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      onGenerateRoute: Routes.generateRoute,
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            appBar: isSmallScreen
            ? AppBar(
                backgroundColor: AppTheme.canvasColor,
                title: Text(title),
                leading: IconButton(
                  onPressed: () {
                    // if (!Platform.isAndroid && !Platform.isIOS) {
                    //   _controller.setExtended(true);
                    // }
                  },
                  icon: const Icon(Icons.menu),
                ),
              )
            : null,
            body: Container(
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
                    child: child
                  ),
                ],
              ),
            )
          );
        }),
      );
  }
}
