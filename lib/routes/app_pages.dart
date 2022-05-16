import 'package:flutter_wanandroid/pages/main/bindings/main_binding.dart';
import 'package:flutter_wanandroid/pages/main/views/main_view.dart';
import 'package:flutter_wanandroid/routes/app_routes.dart';
import 'package:get/route_manager.dart';
import '../pages/not_found/not_found_view.dart';

/// 日期：2022-05-15
/// 描述：页面路由配置项
/// 说明：nameToRoute将String转换为小写，且添加'/'前缀

class AppPages {
  static String init = Routes.main.nameToRoute();

  static final unknownRoute =
      GetPage(
          name: Routes.notFound.nameToRoute(),
          page: () => NotFound());

  static final routes = [
    GetPage(
        name: Routes.main.nameToRoute(),
        page: () => MainView(),
        title: 'Main',
        binding: MainBinding())
  ];
}
