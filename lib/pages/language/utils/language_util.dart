import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_wanandroid/utils/sp_util.dart';
import 'package:get/get.dart';
import '../../../utils/logger/logger_util.dart';
import '../models/model_language.dart';

/// 语言工具类
class LanguageUtil {
  static const String appLanguageKey = 'language';

  /// 获取当前存储的默认语言格式转Locale
  static Locale? getDefaultLocale() {
    var language = getLanguage();
    if (language == null || language.language == '' || language.country == '') {
      //如果没有存储语言设置，则默认是跟随系统
      return Get.deviceLocale;
    } else {
      return Locale(language.language ?? "", language.country);
    }
  }

  /// 更新系统语言
  static updateLocale(Language language) {
    Locale? locale;
    if (language.language == '' || language.country == "") {
      //设置跟随系统
      locale = Get.deviceLocale;
    } else {
      locale = Locale(language.language ?? "", language.country);
    }
    if (locale != null) {
      Get.updateLocale(locale);
    }
  }

  ///保存语言
  static Future<void> saveLanguage(Language language) async{
   bool isSuccess=await SpUtil.saveData(appLanguageKey, jsonEncode(language.toJson()));
   LoggerUtil.e('languageList1 isSuccess-------------------: ${isSuccess}');
  }

  ///获取语言
  static Language? getLanguage() {
    try {
      var languageJson = SpUtil.getData<String>(appLanguageKey);
      LoggerUtil.e('languageList1 getLanguage++++++++++++++++: ${languageJson}');
      if (languageJson == null) {
        //如果没有存储语言设置，则默认是跟随系统
        return null;
      } else {
        return Language.fromJson(jsonDecode(languageJson));
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
