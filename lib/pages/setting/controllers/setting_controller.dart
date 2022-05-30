import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/pages/login_register/utils/login_register_utils.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:flutter_wanandroid/provider/request_api.dart';
import 'package:flutter_wanandroid/utils/cookie_utils.dart';
import 'package:get/get.dart';
import '../../../provider/base_response.dart';
import '../../../res/constant.dart';

/// 日期：2022-05-17
/// 描述：主页-主屏页面-Body-me-设置-控制器
/// 说明：
class SettingController extends BaseController<BaseResponse> {
  void logout() {
    httpManager(
        loadingType: Constant.showLoadingDialog,
        future: provider.get(RequestAPI.logout),
        onSuccess: (value) {
          isLogin=false;
          Get.back();
        },
        onFail: (fail) {
          EasyLoading.showError('退出出错:${fail.errorMsg}');
        },
        onError: (error) {
          EasyLoading.showError('退出出错:${error.errorMsg}');
        });
  }
}
