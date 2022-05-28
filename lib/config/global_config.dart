import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/config/api_provider_config.dart';
import 'package:flutter_wanandroid/config/get_config.dart';
import 'package:flutter_wanandroid/pages/login_register/utils/login_register_utils.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:get/get.dart';

import '../pages/theme/utils/theme_util.dart';

class Config {
  static const isDebug = true;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    ///Get配置
    await Get.putAsync(() => GetConfig().init());
    await Get.putAsync(() => APIProviderConfig().init());

    ///是否登陆-用于退出重新进入时判断是否登陆
    LoginRegisterUtils().isLogin = LoginRegisterUtils.getUserInfo() != null;
    //BaseController().isLogin=LoginRegisterUtils.getUserInfo()!=null;

    ///配置EasyLoading
    // EasyLoading.instance
    //   ..displayDuration = const Duration(seconds: 1)
    //   ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    //   ..loadingStyle = ThemeUtil.getThemeModel() == ThemeData.dark()
    //       ? EasyLoadingStyle.light
    //       : EasyLoadingStyle.dark
    //   ..indicatorSize = 45.0
    //   ..radius = 10.0
    //   ..progressColor = Colors.transparent
    //   ..backgroundColor = Colors.transparent
    //   ..indicatorColor = Colors.transparent
    //   ..textColor = Colors.transparent
    //   ..maskColor = Colors.white.withOpacity(0.5)
    //   ..userInteractions = true
    //   ..dismissOnTap = false;
  }

}
