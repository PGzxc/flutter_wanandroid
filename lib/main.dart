import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/config/global_config.dart';
import 'package:flutter_wanandroid/pages/language/utils/language_util.dart';
import 'package:flutter_wanandroid/pages/theme/utils/theme_util.dart';
import 'package:flutter_wanandroid/res/app_theme.dart';
import 'package:flutter_wanandroid/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'i18n/i18n_message.dart';

/// 日期：2022-05-15
/// 描述：项目入口文件
/// 说明：Config.init()；启动前配置项

Future<void> main() async {
  await Config.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,

    unknownRoute: AppPages.unknownRoute,
    initialRoute: AppPages.init,
    getPages: AppPages.routes,

    ///主题设置
    theme: ThemeUtil.getThemeModel(),
    darkTheme: darkTheme,
    themeMode: ThemeMode.light,

    ///语言
    translations: Message(),
    //默认语言
    locale: LanguageUtil.getDefaultLocale(),
  ));
}
