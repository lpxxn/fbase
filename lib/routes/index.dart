import 'package:fbase/pages/Login/index.dart';
import 'package:fbase/pages/Main/index.dart';
import 'package:flutter/material.dart';

Widget getRootWidget() {
  return MaterialApp(
    theme: ThemeData(fontFamily: 'NotoSansSC'),
    routes: getRoutes(),
  );
}

Map<String, WidgetBuilder> getRoutes() {
  return {
    "/": (context) => const MainPage(),
    "/login": (context) => const LoginPage(),
  };
}
