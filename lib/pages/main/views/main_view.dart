import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:flutter_wanandroid/pages/main/views/main_screen_view.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controllers/main_controller.dart';
import 'main_drawer.dart';

/// 日期：2022-05-16
/// 描述：主页
/// 说明：包含：MainScreen(主屏页面)+MenuScreen(抽屉页面)

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: _buildAppBar(),
        drawer: const MainDrawer(),
        body: const MainScreen()));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return GetBuilder<AppDrawerController>(
  //     builder: (_) => ZoomDrawer(
  //       style: DrawerStyle.defaultStyle,
  //       moveMenuScreen: false,
  //       controller: _.zoomDrawerController,
  //       menuScreen: const MenuScreen(),
  //       mainScreen: const MainScreen(),
  //       borderRadius: 0.0,
  //       showShadow: true,
  //       angle: 0.0,
  //       drawerShadowsBackgroundColor: Colors.transparent,
  //       slideWidth: MediaQuery.of(context).size.width * 0.85,
  //       openCurve: Curves.fastOutSlowIn,
  //       closeCurve: Curves.elasticOut,
  //     ),
  //   );
  // }

  AppBar? _buildAppBar() {
    return AppBar(
      elevation: 4.0,
      centerTitle: true,
      title: Text("${controller.currentTitle}"),
      actions: [
        (controller.currentTitle == Keys.me.tr)
            ? IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Get.toNamed(Routes.setting);
                },
              )
            : IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              )
      ],
    );
  }
}
