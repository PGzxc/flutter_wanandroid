import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wanandroid/config/get_config.dart';
import 'package:flutter_wanandroid/pages/main/controllers/drawer_controller.dart';
import 'package:flutter_wanandroid/utils/logger/logger_utils.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import '../utils/logger/logger_util.dart';

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
    await Get.putAsync(() => GetConfig().init());
    Get.put(() => AppDrawerController());
  }
}
