import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanandroid/config/api_provider_config.dart';
import 'package:flutter_wanandroid/config/get_config.dart';
import 'package:flutter_wanandroid/pages/login_register/utils/login_register_utils.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:get/get.dart';

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

    ///配置登陆成功与否到控制器和判断依据
    BaseController baseController = Get.put(BaseController());
    baseController.isLogin = LoginRegisterUtils.getUserInfo() != null;

    ///是否登陆-用于退出重新进入时判断是否登陆
    //LoginRegisterUtils().isLogin = LoginRegisterUtils.getUserInfo() != null;


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
