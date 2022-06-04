import 'package:flutter_wanandroid/pages/navigation/controllers/navigation_site_controller.dart';
import 'package:flutter_wanandroid/pages/navigation/controllers/navigation_tree_controller.dart';
import 'package:flutter_wanandroid/pages/navigation/controllers/navigation_wx_controller.dart';
import 'package:get/instance_manager.dart';

///说明：导航-控制器绑定
class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationTreeController());
    Get.lazyPut(() => NavigationSiteController());
    Get.lazyPut(() => NavigationWxController());
  }
}
