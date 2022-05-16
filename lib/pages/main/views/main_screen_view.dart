import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:flutter_wanandroid/pages/main/controllers/drawer_controller.dart';
import 'package:flutter_wanandroid/pages/main/controllers/main_controller.dart';
import 'package:flutter_wanandroid/pages/main/views/body_view.dart';
import 'package:get/get.dart';

/// 日期：2022-05-16
/// 描述：主页-主屏页面
/// 说明：包含：MainScreen(主屏页面)+MenuScreen(抽屉页面)

class MainScreen extends GetView<AppDrawerController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController mainController=Get.find();
    return Obx(() =>Scaffold(
      appBar:_buildAppBar(mainController) ,
      body: BodyView(),
    ) ) ;
  }

  PreferredSizeWidget? _buildAppBar(MainController mainController){
    return  (mainController.currentTitle==Keys.me)? null :AppBar(
      elevation: 4.0,
      title: Obx(()=>Text("${mainController.currentTitle}", style: TextStyle(color: Colors.black),)) ,
      backgroundColor: Colors.white,
      leading: IconButton(icon: const Icon(Icons.menu, color: Colors.black,), onPressed: ()=> controller.toggleDrawer()),
      actions: [IconButton(
        icon: const Icon(Icons.search, color: Colors.black,),
        onPressed: () {print('leading.....${controller}');},
      )],
    );
  }
}


