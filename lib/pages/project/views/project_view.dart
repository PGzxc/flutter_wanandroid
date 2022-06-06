import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/project/controllers/project_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/tabs/gf_segment_tabs.dart';
import 'package:getwidget/components/tabs/gf_tabbar_view.dart';

import '../../../provider/refresh/common_state_page.dart';
import '../../../widgets/keep_alive_wrapper.dart';
import '../project_tree_children/project_tree_children_page.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-project-页面
/// 说明：
class ProjectView extends GetView<ProjectController> {
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getProjectTreeList();
    return CommonStatePage<ProjectController>(
      controller: controller,
      onPressed: () => controller.getProjectTreeList(),
      child: Obx(() {
        return Scaffold(
          appBar: _buildAppBar(),
          body: sliverPageView(context, controller),
        );
      }),
    );
  }

  ///项目标题栏
  AppBar? _buildAppBar() {
    return controller.projectTreeList.isNotEmpty
        ? AppBar(
            title: const Text('项目'),
            actions: const [Icon(Icons.search)],
            bottom: TabBar(
                tabs: controller.projectTreeList.map((f) {
                  return Text(f.name);
                }).toList(),
                controller: controller.tabController,
                indicatorColor: Colors.red,
                indicatorSize: TabBarIndicatorSize.tab,
                isScrollable: true,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                indicatorWeight: 5.0),
          )
        : null;
  }

  ///导航条下面的内容
  Widget? sliverPageView(BuildContext context, ProjectController controller) {
    if (controller.projectTreeList.isNotEmpty) {
      var pageViewList = controller.projectTreeList
          .map((element) => KeepAliveWrapper(
                child: ProjectTreeChildrenPage(id: element.id),
              ))
          .toList();
      return TabBarView(
        controller: controller.tabController,
        children: pageViewList,
      );
    }
    return null;
  }
}
