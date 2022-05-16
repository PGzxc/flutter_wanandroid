import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../controllers/drawer_controller.dart';

/// 日期：2022-05-16
/// 描述：主页-抽屉
/// 说明：包含：MainScreen(主屏页面)+MenuScreen(抽屉页面)

class MenuScreen extends GetView<AppDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: _buildDrawerView(),
    );
  }

  Widget _buildDrawerView() {
    return GestureDetector(
        child: ListView(padding: const EdgeInsets.all(0.0), children: <Widget>[
      UserAccountsDrawerHeader(
        accountName: const Text('username'),
        accountEmail: const Text('username@163.com'),
        currentAccountPicture: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        onDetailsPressed: () {},
        otherAccountsPictures: const <Widget>[
          CircleAvatar(child: Icon(Icons.star)),
        ],
        decoration: const BoxDecoration(color: Colors.green),
      ),
      ListTile(
        leading: const Icon(Icons.add_moderator_outlined,),
        trailing: const Icon(Icons.arrow_forward_ios),
        title: const Text('账号安全'),
        onTap: () {controller.toggleDrawer();},
      ),
      ListTile(
        onTap: () {controller.toggleDrawer();},
        title: Text('个人信息'),
        leading: Icon(Icons.account_circle_outlined),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
      ListTile(
          onTap: () {controller.toggleDrawer();},
          title: Text('设置'),
          leading: Icon(Icons.settings),
          trailing: Icon(Icons.arrow_forward_ios)),
    ]));
  }
}
