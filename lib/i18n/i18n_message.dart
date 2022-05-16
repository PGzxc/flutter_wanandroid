import 'package:flutter_wanandroid/i18n/i18n_en.dart';
import 'package:flutter_wanandroid/i18n/i18n_zh.dart';
import 'package:get/get.dart';

class Message extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    I18nZH.zhKey: I18nZH.zhValues,
    I18nEn.enKey: I18nEn.enValues
  };
}
