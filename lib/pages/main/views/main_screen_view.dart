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

    // MainController mainController=Get.find();
    // AppDrawerController controller= Get.put(AppDrawerController());
    // return Obx(() =>Scaffold(
    //   appBar:_buildAppBar(mainController,controller) ,
    //   body: const BodyView(),
    // ) ) ;
  }

  // PreferredSizeWidget? _buildAppBar(MainController mainController,AppDrawerController controller){
  //   return  (mainController.currentPage==4)? AppBar(
  //     elevation: 4.0,
  //     leading: IconButton(icon: const Icon(Icons.menu), onPressed: ()=> controller.toggleDrawer()),
  //     actions: [IconButton(
  //       icon: const Icon(Icons.settings),
  //       onPressed: () {Get.toNamed(Routes.setting);},
  //     )],
  //   ) :AppBar(
  //     elevation: 4.0,
  //     title: Obx(()=>Text("${mainController.currentTitle}")) ,
  //     leading: IconButton(icon: const Icon(Icons.menu), onPressed: ()=> controller.toggleDrawer()),
  //     actions: [IconButton(
  //       icon: const Icon(Icons.search),
  //       onPressed: () {},
  //     )],
  //   );
  // }
}


