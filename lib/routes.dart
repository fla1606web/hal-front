import 'package:flutter/material.dart';
import 'package:flutter_app/pages/create_database_screen.dart';
import 'package:flutter_app/pages/data_screen.dart';
import 'package:flutter_app/pages/data_entity_screen.dart';
import 'package:flutter_app/pages/login_screen.dart';

import 'pages/index_screen.dart';
import 'pages/mac_book_pro_1.dart';
import 'pages/mac_book_pro_2.dart';
import 'pages/mac_book_pro_3.dart';
import 'pages/mac_book_pro_5.dart';
import 'pages/mac_book_pro_6.dart';
import 'pages/mac_book_pro_7.dart';
import 'pages/mac_book_pro_8.dart';
import 'pages/mac_book_pro_9.dart';
//import 'utils/common_widgets/invalid_route.dart';
import 'values/app_routes.dart';

class Routes {
  const Routes._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Route<dynamic> getRoute({
      required Widget widget,
      bool fullscreenDialog = false,
    }) {
      return MaterialPageRoute<void>(
        builder: (context) => widget,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }

    switch (settings.name) {
      case AppRoutes.login:
        return getRoute(widget: LoginPage());

      case AppRoutes.register:
        return getRoute(widget: const MacBookPro9());

      case AppRoutes.index:
        return getRoute(widget: const IndexPage());

      case AppRoutes.dataEntity:
        return getRoute(widget: const DataEntityPage());

      case AppRoutes.createDatabase:
        return getRoute(widget: CreateDatabasePage());

      case AppRoutes.data:
        return getRoute(widget: const DataPage());

      /// An invalid route. User shouldn't see this,
      /// it's for debugging purpose only.
      default:
        return getRoute(widget: MacBookPro1());
    }
  }
}
