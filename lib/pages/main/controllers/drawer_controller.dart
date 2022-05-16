import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';

/// 日期：2022-05-16
/// 描述：主页-抽屉-控制器
/// 说明：包含：MainScreen(主屏页面)+MenuScreen(抽屉页面)

class AppDrawerController extends GetxController{

  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }

}