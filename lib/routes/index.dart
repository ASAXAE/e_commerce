//管理路由
import 'package:e_commerce/pages/Login/index.dart';
import 'package:e_commerce/pages/Main/index.dart';
import 'package:e_commerce/pages/ProductDetail/index.dart';
import 'package:e_commerce/pages/cart/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 返回 app 根级组件
Widget getRouteWidget() {
  return GetMaterialApp(
    // 命名路由
    initialRoute: "/",
    getPages: getRootRoutes(),
  );
}

// 返回该 app 的路由配置
List<GetPage> getRootRoutes() {
  return [
    GetPage(name: "/", page: () => MainPage()), // 主页路由
    GetPage(name: "/login", page: () => LoginPage()), // 登录路由
    GetPage(
      name: "/product-detail/:id",
      page: () => ProductDetailView(productId: Get.parameters['id'] ?? ''),
    ),
    GetPage(name: "/cart", page: () => CartView()), // 购物车单独路由
  ];
}

