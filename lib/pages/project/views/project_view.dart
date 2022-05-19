import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/project/controllers/project_controller.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-project-页面
/// 说明：
class ProjectView extends GetView<ProjectController>{
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Scaffold(appBar: AppBar(title: Text('Project'),),);
    return const Center(child: Text('Project'));
  }
}