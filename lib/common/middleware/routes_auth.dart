import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/common/routes/app_pages.dart';

class RouteAuthMiddleware extends GetMiddleware {
  // @override
  // int priority = 0;

  // RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings redirect(String route) {
    //自己業務，沒有登入，去登入
    Future.delayed(Duration(seconds: 1), () => Get.snackbar("提示", "请先登录APP"));
    return RouteSettings(name: AppRoutes.Login);
  }
}
