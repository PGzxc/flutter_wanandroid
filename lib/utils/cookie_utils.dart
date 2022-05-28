import 'package:flutter_wanandroid/utils/sp_util.dart';
import '../../../utils/logger/logger_util.dart';

class CookieUtils {
  static const String setCookie = 'setCookie';

  ///保存Cookie信息
  static Future<void> saveCookie(String cookie) async {
    bool isSuccess = await SpUtil.saveData<String>(setCookie, cookie);
    LoggerUtil.e('Cookie isSuccess-------------------: ${isSuccess}');
  }

  ///获取用户信息
  static String? getCookie() {
    String? cookie = SpUtil.getData<String>(setCookie);
    return (cookie == null) ? null : cookie;
  }

  ///清除用户信息
  static void clearCookie() {
    SpUtil.clearData(setCookie);
  }
}
