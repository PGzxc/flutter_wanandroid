import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/utils/sp_util.dart';
import '../../../utils/logger/logger_util.dart';

/// 主题工具类
class ThemeUtil {
  static const String darkModel = 'darkModel';

  ///保存语言
  static Future<void> updateThemeModel(bool isDark) async {
    bool isSuccess = await SpUtil.saveData<bool>(darkModel, isDark);
    LoggerUtil.e('languageList1 isSuccess-------------------: ${isSuccess}');
  }

  ///获取语言
  static ThemeData? getThemeModel() {
    bool isDark = SpUtil.getData<bool>(darkModel) ?? false;
    ThemeData theme = isDark ? ThemeData.dark() : ThemeData.light();
    return theme;
  }
}
