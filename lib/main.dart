import 'package:flutter/material.dart';
import 'package:flutter_app/pages/create_database_screen.dart';
import 'package:flutter_app/pages/data_screen.dart';
import 'package:flutter_app/pages/data_entity_screen.dart';
import 'package:flutter_app/pages/index_screen.dart';

import 'package:flutter_app/pages/mac_book_pro_1.dart';
import 'package:flutter_app/pages/mac_book_pro_2.dart';
import 'package:flutter_app/pages/mac_book_pro_3.dart';
import 'package:flutter_app/pages/mac_book_pro_5.dart';
import 'package:flutter_app/pages/mac_book_pro_6.dart';
import 'package:flutter_app/pages/mac_book_pro_7.dart';
import 'package:flutter_app/pages/login_screen.dart';
import 'package:flutter_app/pages/mac_book_pro_8.dart';
import 'package:flutter_app/pages/mac_book_pro_9.dart';
import 'package:flutter_app/resources/local_storage.dart';
import 'package:flutter_app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      //onGenerateRoute: Routes.generateRoute,
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => MacBookPro9(),
        '/index': (context) => const IndexPage(),
        '/entity': (context) => DataEntityPage(),
        '/createDatabase': (context) => CreateDatabasePage(),
        '/data': (context) => DataPage(),
      },
      home: Scaffold(
        //body: MacBookPro1(),
        //body: MacBookPro2(),
        //body: MacBookPro3(),
        //body: MacBookPro5(),
        //body: MacBookPro6(),
        body: IndexPage(),
        //body: MacBookPro7(),
        //body: MacBookPro8(),
        //body: LoginPage(),
      ),
    );
  }
}
