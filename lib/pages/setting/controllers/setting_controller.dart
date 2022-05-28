import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/pages/login_register/utils/login_register_utils.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:flutter_wanandroid/utils/cookie_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/api_provider_config.dart';
import '../../../provider/base_response.dart';

/// 日期：2022-05-17
/// 描述：主页-主屏页面-Body-me-设置-控制器
/// 说明：
class SettingController extends BaseController<BaseResponse> {
  void logout() {
    EasyLoading.show(status: '加载中...');
    provider.logout().then((value) {
      if (value.success) {
        EasyLoading.showSuccess('退出成功');
        ///清除Cookie
        CookieUtils.clearCookie();
        ///清除用户名和密码
        LoginRegisterUtils.clearUserInfo();
        ///全局变量，是否登陆设置
        //Get.find<APIProviderConfig>().isLogin=false;
        Get.back();

      } else {
        EasyLoading.showError('退出出错:${value.errorMsg}');
      }
      EasyLoading.dismiss();
    });
  }
}
