import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/main/controllers/main_controller.dart';
import 'package:get/get.dart';

/// 日期：2022-05-16
/// 描述：主页-主屏页面-Body
/// 说明：包含：MainScreen(主屏页面)+MenuScreen(抽屉页面)

class BodyView extends GetView<MainController>{
  const BodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer: _buildDrawerView(context),
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: _buildPageView());
  }

  /// 底部导航栏
  Widget _buildBottomNavigationBar() {
    return Obx(() {
      return BottomNavigationBar(
        items: controller.bottomTabs,
        currentIndex: controller.currentPage,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 13,
        onTap: (int index) => controller.switchBottomTabBar(index),
      );
    });
  }

  /// 内容页
  Widget _buildPageView() {
    return PageView(
      //禁止滑动
      //physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: (index) => controller.onPageChanged(index),
      //禁止滑动
      // physics: const NeverScrollableScrollPhysics(),
      children: controller.tabPageBodies,
    );
  }
}