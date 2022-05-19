import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:get/get.dart';
import '../../../utils/logger/logger_util.dart';
import '../models/model_language.dart';
import '../utils/language_util.dart';

/// 日期：2022-05-17
/// 描述：主页-主屏页面-Body-me-设置-控制器
/// 说明：
class LanguageController extends GetxController {
  final languageList = RxList<Language>();

  final _currentLanguage = "".obs;

  get currentLanguage => _currentLanguage.value;

  set currentLanguage(value) => _currentLanguage.value = value;

  @override
  void onInit() {
    super.onInit();
    languageList.assignAll(supportLanguageList);
    LoggerUtil.d('languageList1 : ${languageList.toJson()}');
    //获取存储语言格式
    var languageSp = LanguageUtil.getLanguage();
    LoggerUtil.d('languageList1 select-------------------: ${languageSp?.toJson()}');
    if (languageSp == null) {
      for (var value in languageList) {
        if (value.name == Keys.systemMode) {
          value.isSelect = true;
          currentLanguage = Keys.systemMode.tr;
          LoggerUtil.d('languageList1 select: ${value.name}');
        }
      }
    } else {
      //定位当前选中的语言
      for (var value in languageList) {
        if (value.name == languageSp.name) {
          value.isSelect = true;
          currentLanguage = value.name;
          LoggerUtil.d('languageList2 select: ${value.name}');
        }
      }
    }
  }

  onSelectLanguage(int currentIndex) {
    for (var element in languageList) {
      element.isSelect = false;
    }
    languageList[currentIndex].isSelect = true;
    //本地存储-更新语言格式
    LanguageUtil.saveLanguage(languageList[currentIndex]);
    //使用GetX更新语言格式
    LanguageUtil.updateLocale(languageList[currentIndex]);
    currentLanguage = languageList[currentIndex].name;
  }
}

///新增语言要在此处手动增加
final supportLanguageList = [
  Language(name: Keys.systemMode, language: '', country: ''),
  Language(name: Keys.simpleChinese, language: 'zh', country: 'CN'),
  Language(name: Keys.usEnglish, language: 'en', country: 'US'),
];
