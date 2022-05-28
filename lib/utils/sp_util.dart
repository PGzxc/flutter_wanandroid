import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logger/logger_util.dart';

class SpUtil {
  ///获取global_config中配置到SharedPreferences
  static SharedPreferences getSharedPreferences() {
    SharedPreferences sharedPreferences = Get.find<SharedPreferences>();
    return sharedPreferences;
  }

  ///保存数据
  static Future<bool> saveData<T>(String key, T value) async {
    SharedPreferences prefs = getSharedPreferences();
    late bool isSuccess;
    switch (T) {
      case String:
        isSuccess = await prefs.setString(key, value as String);
        break;
      case int:
        isSuccess = await prefs.setInt(key, value as int);
        break;
      case bool:
        isSuccess = await prefs.setBool(key, value as bool);
        break;
      case double:
        isSuccess = await prefs.setDouble(key, value as double);
        break;
      case List<String>:
        isSuccess = await prefs.setStringList(key, value as List<String>);
        break;
    }
    return isSuccess;
  }

  ///读取数据
  static T? getData<T>(String key) {
    SharedPreferences prefs = getSharedPreferences();
    late T? res;
    switch (T) {
      case String:
        res = prefs.getString(key) as T?;
        break;
      case int:
        res = prefs.getInt(key) as T?;
        break;
      case bool:
        res = prefs.getBool(key) as T?;
        break;
      case double:
        res = prefs.getDouble(key) as T?;
        break;
      case List<String>:
        res = prefs.getStringList(key) as T?;
        break;
    }
    LoggerUtil.d('res=============: ${res}');
    return res;
  }

  ///清除数据
  static void clearData(String key) {
    SharedPreferences prefs = getSharedPreferences();
    prefs.remove(key);
  }
}
