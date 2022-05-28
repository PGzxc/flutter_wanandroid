// import 'package:flutter/material.dart';
// import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
// import 'package:flutter_wanandroid/res/app_theme.dart';
// import 'package:get/get.dart';
// import '../../login_register/models/login_register_response.dart';
// import '../../login_register/utils/login_register_utils.dart';
// import '../controllers/drawer_controller.dart';
//
// /// 日期：2022-05-16
// /// 描述：主页-抽屉
// /// 说明：包含：MainScreen(主屏页面)+MenuScreen(抽屉页面)
//
// class MenuScreen extends GetView<AppDrawerController> {
//   const MenuScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     //AppDrawerController controller = Get.put(AppDrawerController());
//     return Obx(() => Container(
//       color: context.scaffoldBackgroundColor,
//       child: _buildDrawerView(controller),
//     ));
//   }
//
//   Widget _buildDrawerView(AppDrawerController controller) {
//     bool isLogin = LoginRegisterUtils().isLogin;
//     UserInfo? userInfo=LoginRegisterUtils.getUserInfo();
//     return GestureDetector(
//         child: ListView(padding: const EdgeInsets.all(0.0), children: <Widget>[
//       UserAccountsDrawerHeader(
//         accountName:  Text(!isLogin?'username':'${userInfo?.nickname}'),
//         accountEmail: Text(!isLogin?'username@163.com':'${userInfo?.email}'),
//
//         //accountName: const Text('username'),
//         //accountEmail: const Text('username@163.com'),
//         currentAccountPicture: const CircleAvatar(
//           child: Icon(Icons.person),
//         ),
//         onDetailsPressed: () {},
//         arrowColor: Colors.transparent,
//         //otherAccountsPictures: const <Widget>[CircleAvatar(child: Icon(Icons.star)),],
//         decoration: const BoxDecoration(color: Colors.green),
//       ),
//       ListTile(
//         leading: const Icon(
//           Icons.today,
//         ),
//         trailing: const Icon(Icons.arrow_forward_ios),
//         title: Text(Keys.menuTodoList.tr),
//         onTap: () {
//           controller.toggleDrawer();
//         },
//       ),
//       ListTile(
//         onTap: () {
//           controller.toggleDrawer();
//         },
//         title: Text(Keys.menuUnreadMsg.tr),
//         leading: const Icon(Icons.message_rounded),
//         trailing: const Icon(Icons.arrow_forward_ios),
//       ),
//       ListTile(
//           onTap: () {
//             controller.toggleDrawer();
//           },
//           title: Text(Keys.menuWenDa.tr),
//           leading: const Icon(Icons.question_answer),
//           trailing: const Icon(Icons.arrow_forward_ios)),
//           ListTile(
//               onTap: () {
//                 controller.logout();
//                 controller.toggleDrawer();
//               },
//               title: Text(Keys.logout.tr),
//               leading: const Icon(Icons.logout),
//               trailing: const Icon(Icons.arrow_forward_ios))
//     ]));
//   }
// }
