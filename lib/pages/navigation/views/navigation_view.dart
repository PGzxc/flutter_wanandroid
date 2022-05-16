import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/navigation/controllers/navigation_controller.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-navigation-页面
/// 说明：

class NavigationView extends GetView<NavigationController>{
  @override
  Widget build(BuildContext context) {
    //return Scaffold(appBar: AppBar(title: Text('Navigation'),),);
    return Center(child: Text('Navigation'));
  }
}