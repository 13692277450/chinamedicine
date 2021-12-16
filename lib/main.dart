// @dart=2.9
import 'package:chinamedicine2/pages/countmodle.dart';
import 'package:chinamedicine2/pages/settingsPage.dart';
import 'package:chinamedicine2/pages/sortPage.dart';
import 'package:flutter/foundation.dart';
import 'package:chinamedicine2/mainok.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'package:mysql1/mysql1.dart' as mysql;
import '../pages/routes.dart';
import '../pages/tabs.dart';
import '../pages/popmenu.dart';
import '../pages/settingsPage.dart';
import '../pages/sortPage.dart';

void main() => runApp(MyApp());
// final routes = {
//   '/': (context) => Tabs(),
//   '/sort_page': (context, {arguments}) => sort_page(arguments: arguments),
//   '/popupmenupage': (context, {arguments}) => popupmenu_page(arguments),
//   '/settings_page': (context, {arguments}) =>
//       settings_page(arguments: arguments),
// };

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) {
            return CountModle();
          }),
        ],
        child: MaterialApp(
            // initialRoute: '/sort_pagecold',
            debugShowCheckedModeBanner: false,
            // routes: {
            //   // '/': (context) => Tabs(),
            //   '/sort_page': (
            //     context,
            //   ) =>
            //       sort_page(),
            //   '/popupmenupage': (context, {arguments}) => popupmenu_page(arguments),
            //   '/settings_page': (context) => settings_pageX(),
            // },
            home: Scaffold(
              body: Tabs(),
            ),
            onGenerateRoute: onGenerateRoute
            // (RouteSettings settings) {
            //   //String? 表示name为可空类型
            //   final String name = settings.name;
            //   //Function? 表示pageContentBuilder为可空类型
            //   final Function pageContentBuilder = routes[name];
            //   if (pageContentBuilder != null) {
            //     if (settings.arguments != null) {
            //       final Route route = MaterialPageRoute(
            //           builder: (context) => pageContentBuilder(context,
            //               arguments: settings.arguments));
            //       return route;
            //     } else {
            //       final Route route = MaterialPageRoute(
            //           builder: (context) => pageContentBuilder(context));
            //       return route;
            //     }
            ));
  }
}
