import 'package:flutter_wanandroid/pages/theme/controllers/theme_controller.dart';
import 'package:get/instance_manager.dart';

/// 日期：2022-05-17
/// 描述：主页-主屏页面-Body-me-设置-theme-binding
/// 说明：
class ThemeBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ThemeController());
  }
}