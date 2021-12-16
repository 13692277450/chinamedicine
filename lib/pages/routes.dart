import 'package:chinamedicine2/pages/famousdoctor.dart';
import 'package:chinamedicine2/pages/upgrade.dart';
import 'package:flutter/material.dart';
import 'sortPage.dart';
import 'popmenu.dart';
import 'tabs.dart';
import 'home.dart';
import 'newsPage.dart';
import 'package:chinamedicine2/main.dart';
import '../res/Cold.dart';
import '../pages/sortPage.dart';

//配置路由,定义Map类型的routes,Key为String类型，Value为Function类型
final routes = {
  '/': (context) => Tabs(),
  '/sort_page': (context) => sort_pageX(),
  '/upgrade': (context) => upgrade(),
  '/famousdoctor': (context) => famousedoctor_pageX(),

  //'/popupmenupage': (context, {arguments}) => popupmenu_page(arguments),
};

// final Map<String, Function> routes = {
//   '/': (context) => Tabs(),
//   '/sort_page': (context) => sort_page(),
//   '/popupmenupage': (context, {arguments}) =>
//       popupmenu_page(arguments: arguments),
// };

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  //String? 表示name为可空类型
  final String? name = settings.name;
  //Function? 表示pageContentBuilder为可空类型
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
