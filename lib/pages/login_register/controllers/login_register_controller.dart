import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:flutter_wanandroid/models/login_register_response.dart';
import 'package:flutter_wanandroid/pages/login_register/utils/login_register_utils.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:get/get.dart';
import '../../../provider/request_api.dart';
import '../../../res/constant.dart';
import '../../../utils/keyboard_util.dart';

enum ButtonType { login, register }

class LoginRegisterController extends BaseController<UserInfo> {

  final _welcomeContent = Keys.welcomeLoginContent.tr.obs;
  get welcomeContent => _welcomeContent.value;
  set welcomeContent(value) => _welcomeContent.value = value;

  /// 登录注册类型
  final _buttonType = ButtonType.login.obs;
  get buttonType => _buttonType.value;
  set buttonType(value) => _buttonType.value = value;

  /// 登录注册按钮描述语
  final _switchButtonTypeDesc = Keys.switchButtonRegisterDesc.tr.obs;
  get switchButtonTypeDesc => _switchButtonTypeDesc.value;
  set switchButtonTypeDesc(value) => _switchButtonTypeDesc.value = value;

  final _buttonTypeDesc = Keys.loginContent.tr.obs;
  get buttonTypeDesc => _buttonTypeDesc.value;
  set buttonTypeDesc(value) => _buttonTypeDesc.value = value;

  /// 用户名
  final _userName = "".obs;
  get userName => _userName.value;
  set userName(value) => _userName.value = value;

  /// 密码
  final _password = "".obs;
  get password => _password.value;
  set password(value) => _password.value = value;

  /// 确认密码
  final _ensurePassword = "".obs;
  get ensurePassword => _ensurePassword.value;
  set ensurePassword(value) => _ensurePassword.value = value;

  late final TextEditingController textEditingControllerUserName;
  late final TextEditingController textEditingControllerUserPassword;
  late final TextEditingController textEditingControllerUserEnsurePassword;

  @override
  void onInit() {
    super.onInit();
    textEditingControllerUserName = TextEditingController();
    textEditingControllerUserPassword = TextEditingController();
    textEditingControllerUserEnsurePassword = TextEditingController();
  }

  /// 切换登录注册类型
  void switchLoginRegister(BuildContext context) {
    if (buttonType == ButtonType.login) {
      // 点击前是登陆类型，则切换为注册类型
      buttonType = ButtonType.register;
      // switchButtonTypeDesc = '已有账号，去登录';
      switchButtonTypeDesc = Keys.switchButtonLoginDesc.tr;
      buttonTypeDesc = Keys.registerContent.tr;
      welcomeContent = Keys.welcomeRegisterContent.tr;
    } else {
      // 点击前是注册类型，则切换为登录类型
      buttonType = ButtonType.login;
      // switchButtonTypeDesc = '没有账号，去注册';
      switchButtonTypeDesc = Keys.switchButtonRegisterDesc.tr;
      buttonTypeDesc = Keys.loginContent.tr;
      welcomeContent = Keys.welcomeLoginContent.tr;
    }
    // 清空输入框
    userName = "";
    password = "";
    ensurePassword = "";
    textEditingControllerUserName.clear();
    textEditingControllerUserPassword.clear();
    textEditingControllerUserEnsurePassword.clear();
    KeyboardUtils.hideKeyboard(context);
  }

  /// 登录
  void goToLoginRegister() {
    if (userName.toString().trim().isEmpty) {
      Get.snackbar(Keys.userNameEmptyInfo.tr, '',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (password.toString().trim().isEmpty) {
      Get.snackbar(Keys.passwordEmptyInfo.tr, '',
          snackPosition: SnackPosition.BOTTOM);

      return;
    }

    if (buttonType == ButtonType.register) {
      if (ensurePassword.toString().trim().isEmpty) {
        Get.snackbar(Keys.ensurePasswordEmptyInfo.tr, '',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      if (userName.toString().trim().isNotEmpty &&
          password.toString().trim().isNotEmpty &&
          ensurePassword.toString().trim().isNotEmpty) {
        if (password.toString().trim() != ensurePassword.toString().trim()) {
          Get.snackbar(Keys.ensurePasswordFail.tr, '',
              snackPosition: SnackPosition.BOTTOM);
          return;
        }
      }
    }

    /// 登录 POST https://www.wanandroid.com/user/login
    /// 参数：username，password   登录后会在cookie中返回账号密码，只要在客户端做cookie持久化存储即可自动登录验证。
    /// 简单做法，存储账号密码（demo）
    var paramsLogin = {
      "username": userName.toString().trim(),
      "password": password.toString().trim(),
    };

    var paramsRegister = {
      "username": userName.toString().trim(),
      "password": password.toString().trim(),
      "repassword": ensurePassword.toString().trim(),
    };

    String requestUrl =
        buttonType == ButtonType.login ? RequestAPI.login : RequestAPI.register;

    Map<String, dynamic>? requestParams =
        buttonType == ButtonType.login ? paramsLogin : paramsRegister;

    httpManager(
        loadingType: Constant.showLoadingDialog,
        future: provider.post(requestUrl, null, query: requestParams),
        onSuccess: (value) {
          ///保存用户数据
          UserInfo data = UserInfo.fromJson((value));
          LoginRegisterUtils.saveUserInfo(data);
          isLogin=true;///isLogin放到saveUserInfo的后面，否则出现问题
          Get.back();
        },
        onFail: (response) {
          EasyLoading.showError('${Keys.loginFail.tr} \n ${response.errorMsg}');
        },
        onError: (response) {
          EasyLoading.showError('${Keys.loginFail.tr} \n ${response.errorMsg}');
        });
  }

  //用户协议勾选事件
  var isChecked = false.obs;

  void changeChecked(bool value) {
    isChecked.value = value;
  }
}
