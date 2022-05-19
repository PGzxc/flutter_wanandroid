import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanandroid/config/get_config.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    //Get.put(() => AppDrawerController());
    ///SharedPreference配置
    //await Get.putAsync(()=>SharedPreferences.getInstance());
  }
}
