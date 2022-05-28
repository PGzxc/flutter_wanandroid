import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:flutter_wanandroid/models/login_register_response.dart';
import 'package:flutter_wanandroid/pages/login_register/utils/login_register_utils.dart';
import 'package:flutter_wanandroid/pages/me/controllers/me_controller.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:get/get.dart';

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

    EasyLoading.show(status: '加载中...');

    ///调用接口
    provider.loginRegister(buttonType.toString(), buttonType == ButtonType.login ? paramsLogin : paramsRegister)
        .then((value) {
      if (value.success) {
        ///保存用户数据
        UserInfo data = UserInfo.fromJson((value.data));
        LoginRegisterUtils.saveUserInfo(data);
        EasyLoading.showSuccess('登陆成功');
        MeController meController=Get.find();
        meController.onInit();
        Get.back();
      } else {
        EasyLoading.showError('登陆出错:${value.errorMsg}');
      }
      EasyLoading.dismiss();
    });
  }

  //登陆按钮点击事件
  login(TextEditingController userNameController,
      TextEditingController passWordController) {
    var userName = userNameController.text;
    var passWord = passWordController.text;

    //1-用户协议是否勾选
    // if (!isChecked.value) {
    //   Get.snackbar('用户协议未选中', '请勾选用户协议', snackPosition: SnackPosition.BOTTOM);
    //   return;
    // }
    //2-用户名判断
    if (userName.isEmpty) {
      Get.snackbar('用户名异常', '用户名为空', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    //3-密码判断
    if (passWord.isEmpty) {
      Get.snackbar('密码异常', '密码为空', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    var loginMap = {
      "username": userName.toString().trim(),
      "password": passWord.toString().trim(),
    };
    provider.loginRegister('login', loginMap).then((value) {
      //change(null, status: RxStatus.loading());
      if (value.success) {
        ///保存用户数据
        UserInfo data = UserInfo.fromJson((value.data));
        LoginRegisterUtils.saveUserInfo(data);
        Get.back();
      } else {
        //change(null, status: RxStatus.error());
      }
    });
  }

  //用户协议勾选事件
  var isChecked = false.obs;

  void changeChecked(bool value) {
    isChecked.value = value;
  }
}
