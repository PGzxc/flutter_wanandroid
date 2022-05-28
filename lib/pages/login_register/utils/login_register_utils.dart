import 'dart:convert';

import 'package:flutter_wanandroid/models/login_register_response.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:flutter_wanandroid/utils/sp_util.dart';
import 'package:get/get.dart';
import '../../../utils/logger/logger_util.dart';

/// 主题工具类
class LoginRegisterUtils {
  static const String userInfo = 'userInfo';
  static final  _isLogin = false.obs;
  get isLogin => _isLogin.value;
  set isLogin(value) => _isLogin.value = value;

 static var aaa=false.obs;

  ///保存用户信息
  static Future<void> saveUserInfo(UserInfo data) async {
    var encode = json.encode(data);
    _isLogin.value=true;
    aaa.value=true;

    bool isSuccess = await SpUtil.saveData<String>(userInfo, encode);
    LoggerUtil.e('LoginRegisterUtils isSuccess-------------------: ${isSuccess}');
  }

  ///获取用户信息
  static UserInfo? getUserInfo() {
    String? userInfoString = SpUtil.getData<String>(userInfo);
    return (userInfoString == null) ? null : UserInfo.fromJson(json.decode(userInfoString));
  }

  ///清除用户信息
  static void clearUserInfo() {
    _isLogin.value=false;
    SpUtil.clearData(userInfo);
  }
}
