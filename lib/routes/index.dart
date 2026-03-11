//管理路由
import 'package:e_commerce/pages/Login/index.dart';
import 'package:e_commerce/pages/Main/index.dart';
import 'package:flutter/material.dart';

//返回app根级组件
Widget getRouteWidget() {
  return MaterialApp(
    //命名路由
    initialRoute: "/",
    routes: getRootRoutes(),
  );
}

//返回该app的路由配置
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/": (context) => MainPage(), //主页路由
    "/login": (context) => LoginPage(), //登录路由
  };
}
