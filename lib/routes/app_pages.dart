import 'package:flutter_wanandroid/pages/main/bindings/main_binding.dart';
import 'package:flutter_wanandroid/pages/main/views/main_view.dart';
import 'package:flutter_wanandroid/pages/setting/bindings/setting_binding.dart';
import 'package:flutter_wanandroid/pages/setting/views/setting_view.dart';
import 'package:flutter_wanandroid/routes/app_routes.dart';
import 'package:get/route_manager.dart';
import '../pages/language/bindings/language_binding.dart';
import '../pages/language/views/language_view.dart';
import '../pages/not_found/not_found_view.dart';
import '../pages/theme/bindings/theme_binding.dart';
import '../pages/theme/views/theme_view.dart';

/// 日期：2022-05-15
/// 描述：页面路由配置项
/// 说明：nameToRoute将String转换为小写，且添加'/'前缀

class AppPages {
  static String init = Routes.main.nameToRoute();

  static final unknownRoute =
      GetPage(name: Routes.notFound.nameToRoute(), page: () => NotFound());

  static final routes = [
    ///主界面
    GetPage(
        name: Routes.main.nameToRoute(),
        page: () => const MainView(),
        title: 'Main',
        binding: MainBinding()),

    ///设置页面
    GetPage(
        name: Routes.setting.nameToRoute(),
        page: () => const SettingView(),
        title: 'Setting',
        binding: SettingBinding()),

    ///theme主题
    GetPage(
        name: Routes.theme.nameToRoute(),
        page: () => const ThemeView(),
        title: 'Theme',
        binding: ThemeBinding()),

    ///Language-语言
    GetPage(
        name: Routes.language.nameToRoute(),
        page: () => const LanguageView(),
        title: 'Language',
        binding: LanguageBinding()),
  ];
}
