import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-home-页面
/// 说明：
class HomeView extends GetView {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //return Scaffold(appBar: AppBar(title: Text('Main'),),
    return const Center(child: Text('Home'));
  }
}
