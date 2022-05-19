import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:flutter_wanandroid/res/app_theme.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../controllers/drawer_controller.dart';

/// 日期：2022-05-16
/// 描述：主页-抽屉
/// 说明：包含：MainScreen(主屏页面)+MenuScreen(抽屉页面)

class MenuScreen extends GetView<AppDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDrawerController controller = Get.put(AppDrawerController());
    return Container(
      color: context.scaffoldBackgroundColor,
      child: _buildDrawerView(controller),
    );
  }

  Widget _buildDrawerView(AppDrawerController controller) {
    return GestureDetector(
        child: ListView(padding: const EdgeInsets.all(0.0), children: <Widget>[
      UserAccountsDrawerHeader(
        accountName: const Text('username'),
        accountEmail: const Text('username@163.com'),
        currentAccountPicture: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        onDetailsPressed: () {},
        arrowColor: Colors.transparent,
        //otherAccountsPictures: const <Widget>[CircleAvatar(child: Icon(Icons.star)),],
        decoration: const BoxDecoration(color: Colors.green),
      ),
      ListTile(
        leading: const Icon(
          Icons.add_moderator_outlined,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        title: Text(Keys.accountSafe.tr),
        onTap: () {
          controller.toggleDrawer();
        },
      ),
      ListTile(
        onTap: () {
          controller.toggleDrawer();
        },
        title: Text(Keys.personInfo.tr),
        leading: const Icon(Icons.account_circle_outlined),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
      ListTile(
          onTap: () {
            controller.toggleDrawer();
          },
          title: Text(Keys.setting.tr),
          leading: const Icon(Icons.settings),
          trailing: const Icon(Icons.arrow_forward_ios)),
    ]));
  }
}
