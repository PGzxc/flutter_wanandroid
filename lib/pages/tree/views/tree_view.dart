import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/tree/controllers/tree_controller.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-tree-页面
/// 说明：

class TreeView extends GetView<TreeController> {
  @override
  Widget build(BuildContext context) {
    //return Scaffold(appBar: AppBar(title: Text('Tree'),),);
    return Center(child: Text('Tree'));
  }
}
