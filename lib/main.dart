import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/config/global_config.dart';
import 'package:flutter_wanandroid/i18n/i18n_message.dart';
import 'package:flutter_wanandroid/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

/// 日期：2022-05-15
/// 描述：项目入口文件
/// 说明：Config.init()；启动前配置项

Future<void> main() async {
  await Config.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    translations: Message(),
    unknownRoute: AppPages.unknownRoute,
    initialRoute: AppPages.init,
    getPages: AppPages.routes,
  ));
}

