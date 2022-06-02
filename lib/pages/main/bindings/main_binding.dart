import 'package:flutter_wanandroid/pages/home/controllers/home_controller.dart';
import 'package:flutter_wanandroid/pages/main/controllers/main_controller.dart';
import 'package:flutter_wanandroid/pages/me/controllers/me_controller.dart';
import 'package:flutter_wanandroid/pages/message/controllers/message_controller.dart';
import 'package:flutter_wanandroid/pages/navigation/controllers/navigation_controller.dart';
import 'package:flutter_wanandroid/pages/project/controllers/project_controller.dart';
import 'package:get/instance_manager.dart';


/// 日期：2022-05-16
/// 描述：主页-页面绑定
/// 说明：包含：MainScreen(主屏页面)+MenuScreen(抽屉页面)

class MainBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => MainController());

    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => ProjectController());
    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => MeController());

  }
}