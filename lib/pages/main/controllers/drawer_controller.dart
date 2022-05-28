// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_zoom_drawer/config.dart';
// import 'package:get/get.dart';
// import '../../../provider/base_controller.dart';
// import '../../../utils/cookie_utils.dart';
// import '../../login_register/utils/login_register_utils.dart';
// import '../../me/models/person_info_response.dart';
//
// /// 日期：2022-05-16
// /// 描述：主页-抽屉-控制器
// /// 说明：包含：MainScreen(主屏页面)+MenuScreen(抽屉页面)
//
// class AppDrawerController extends BaseController<PersonInfoData> {
//   final zoomDrawerController = ZoomDrawerController();
//
//   void toggleDrawer() {
//     print("Toggle drawer");
//     zoomDrawerController.toggle?.call();
//     update();
//   }
//   ///退出登陆
//   void logout() {
//     EasyLoading.show(status: '加载中...');
//     provider.logout().then((value) {
//       if (value.success) {
//         EasyLoading.showSuccess('退出成功');
//
//         ///清除Cookie
//         CookieUtils.clearCookie();
//
//         ///清除用户名和密码
//         LoginRegisterUtils.clearUserInfo();
//
//         ///全局变量，是否登陆设置
//         //Get.find<APIProviderConfig>().isLogin=false;
//         Get.back();
//       } else {
//         EasyLoading.showError('退出出错:${value.errorMsg}');
//       }
//       EasyLoading.dismiss();
//     });
//   }
// }
