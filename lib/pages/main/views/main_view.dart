import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/main/controllers/drawer_controller.dart';
import 'package:flutter_wanandroid/pages/main/views/main_screen_view.dart';
import 'package:flutter_wanandroid/pages/main/views/main_menu_view.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

/// 日期：2022-05-16
/// 描述：主页
/// 说明：包含：MainScreen(主屏页面)+MenuScreen(抽屉页面)

class MainView extends GetView<AppDrawerController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppDrawerController>(
      builder: (_) => ZoomDrawer(
        style: DrawerStyle.style3,
        moveMenuScreen: false,
        controller: _.zoomDrawerController,
        menuScreen: const MenuScreen(),
        mainScreen: const MainScreen(),
        borderRadius: 0.0,
        showShadow: false,
        angle: 0.0,
        drawerShadowsBackgroundColor: Colors.white,
        slideWidth: MediaQuery.of(context).size.width * 0.85,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.elasticOut,
      ),
    );
  }
}
