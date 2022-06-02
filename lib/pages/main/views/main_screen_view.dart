import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/main/controllers/drawer_controller.dart';
import 'package:flutter_wanandroid/pages/main/controllers/main_controller.dart';
import 'package:flutter_wanandroid/pages/main/views/body_view.dart';
import 'package:flutter_wanandroid/routes/app_routes.dart';
import 'package:get/get.dart';

/// 日期：2022-05-16
/// 描述：主页-主屏页面
/// 说明：包含：MainScreen(主屏页面)+MenuScreen(抽屉页面)

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BodyView();
  }
}


