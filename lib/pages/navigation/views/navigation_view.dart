import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/navigation/controllers/navigation_controller.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/tabs/gf_segment_tabs.dart';
import 'package:getwidget/components/tabs/gf_tabbar_view.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-navigation-页面
/// 说明：

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        ///backgroundColor: GFColors.DARK,
        title: GFSegmentTabs(
            width: Get.width,
            height: 40,
            tabController: controller.tabController,
            tabBarColor: GFColors.LIGHT,
            labelColor: GFColors.WHITE,
            unselectedLabelColor: GFColors.DARK,
            indicator: const BoxDecoration(
              color: GFColors.DARK,
              border: Border(
                bottom: BorderSide(
                  color: GFColors.SUCCESS,
                  width: 3,
                ),
              ),
            ),
            //indicatorPadding: const EdgeInsets.all(0),
            //indicatorWeight: 2,
            //border: Border.all(color: Colors.white, width: 1),
            length: 3,
            tabs: controller.tabValues.map((e) => Text(e)).toList()),
      ),
      body: GFTabBarView(
          controller: controller.tabController,
          children: controller.tabPageBodies),
    );
  }
}
