import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/message/controllers/message_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/tabs/gf_segment_tabs.dart';
import 'package:getwidget/components/tabs/gf_tabbar_view.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-tree-页面
/// 说明：

class MessageView extends GetView<MessageController> {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: GFAppBar(
        //backgroundColor: GFColors.INFO,
        actions: [_buildTabsWidget()],
        //title:_buildTabsWidget(),
      ),
      body: GFTabBarView(
          controller: controller.tabController,
          children: controller.tabPageBodies),
    );
  }

  Widget _buildTabsWidget(){
    return  GFSegmentTabs(
        width: Get.width,
        //height: 30,
        //controller: controller.tabController,
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
        tabs: controller.tabValues.map((e) => Text(e)).toList());
  }
}
