import 'package:get/get.dart';
import 'package:myapp/common/middleware/routes_auth.dart';
import 'package:myapp/pages/home/index.dart';
import 'package:myapp/pages/list/index.dart';
import 'package:myapp/pages/list_detail/index.dart';
import 'package:myapp/pages/login/index.dart';
import 'package:myapp/pages/my/index.dart';
import 'package:myapp/pages/nested_navigation/index.dart';
import 'package:myapp/pages/notfound/index.dart';

import 'binding.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Home;

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundView(),
  );

  static final routes = [
    // 白名单
    GetPage(
        name: AppRoutes.Login,
        page: () => LoginView(),
        transition: Transition.downToUp),

//需要登入 中間件
    GetPage(
      name: AppRoutes.My,
      page: () => MyView(),
      middlewares: [
        RouteAuthMiddleware(),
      ],
    ),

    GetPage(name: AppRoutes.Home, page: () => HomeView(), children: [
      GetPage(name: AppRoutes.List, page: () => ListIndexView(), children: [
        GetPage(name: AppRoutes.Detail, page: () => DetailView()),
        GetPage(name: AppRoutes.Detail_ID, page: () => DetailView()),
      ]),
    ]),

    // 嵌套导航
    GetPage(
      name: AppRoutes.NestedNavigator,
      page: () => NestedNavView(),
      binding: NestedBinding(),
    ),
  ];
}
