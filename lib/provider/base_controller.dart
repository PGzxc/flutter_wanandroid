import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/models/login_register_response.dart';
import 'package:flutter_wanandroid/pages/me/controllers/me_controller.dart';
import 'package:flutter_wanandroid/provider/state/load_state.dart';
import 'package:get/get.dart';
import '../config/api_provider_config.dart';
import '../i18n/i18n_keys.dart';
import '../pages/login_register/utils/login_register_utils.dart';
import '../res/constant.dart';
import '../utils/connectivity_utils.dart';
import '../utils/cookie_utils.dart';
import '../utils/logger/logger_util.dart';
import 'api_provider.dart';
import 'base_response.dart';
import 'error_handler.dart';


class BaseController<T> extends GetxController with StateMixin<T> {
  ///网络请求工具
  ApiProvider provider = Get.find<APIProviderConfig>().getAPiProvider();

  ///登陆状态判断
  static final _isLogin = false.obs;
  get isLogin => _isLogin.value;
  set isLogin(value) => _isLogin.value = value;

  ///用户信息
  final _userInfo=UserInfo().obs;
  get userInfo=>_userInfo.value;
  set userInfo(value)=>_userInfo.value=value;


  /// 加载状态
  final _loadState = LoadState.simpleShimmerLoading.obs;
  get loadState => _loadState.value;
  set loadState(value) => _loadState.value = value;

  /// 错误提示
  final _httpErrorMsg = ''.obs;
  get httpErrorMsg => _httpErrorMsg.value;
  set httpErrorMsg(value) => _httpErrorMsg.value = value;

  @override
  void onInit() {
    super.onInit();

    ///登陆状态改变时触发此操作
    ever(_isLogin, (callback) {
      if (isLogin) {
        EasyLoading.showSuccess(Keys.loginSuccess.tr);
        userInfo=LoginRegisterUtils.getUserInfo();
        MeController meController = Get.put(MeController());
        meController.onInit();
      } else {
        EasyLoading.showSuccess(Keys.logoutContent.tr);
        ///清除Cookie
        CookieUtils.clearCookie();
        ///清除用户名和密码
        LoginRegisterUtils.clearUserInfo();
      }
    });
  }

  @override
  void onReady() async {
    super.onReady();
    var connectivityState = await ConnectivityUtils.checkConnectivity();

    LoggerUtil.d('BaseGetController ==> checkConnectivity $connectivityState');

    if (connectivityState != ConnectivityState.none) {
      onReadyInitData();
      //LoggerUtil.d('BaseGetController ==> onReady() initData');
    } else {
      //LoggerUtil.d('BaseGetController ==> onReady() errorNet');
      // 延迟1秒 显示加载loading
      //await Future.delayed(const Duration(seconds: 1));
      //Get.snackbar('提示', '网络异常，请检查你的网络!');
      //loadState = LoadState.fail;
      //httpErrorMsg = '网络异常，请检查你的网络';
    }
  }

  /// onReady() 时期请求数据
  void onReadyInitData() {}
  void httpManager({
    required String loadingType,
    required Future<Response> future,
    Function()? onStart,
    required Function(dynamic value) onSuccess,
    required Function(BaseResponse value) onFail,
    required Function(BaseResponse value)? onError,
  }) async {
    /// 是否显示加载页面、加载页面类型
    if (loadingType == Constant.showLoadingDialog) {
      /// 页面上加载Loading
      EasyLoading.show(status: 'loading...');
    } else if (loadingType == Constant.simpleShimmerLoading) {
      /// 覆盖页面-简单Shimmer动画
      loadState = LoadState.simpleShimmerLoading;
    } else if (loadingType == Constant.multipleShimmerLoading) {
      /// 覆盖页面-列表Shimmer动画
      loadState = LoadState.multipleShimmerLoading;
    } else if (loadingType == Constant.lottieRocketLoading) {
      loadState = LoadState.lottieRocketLoading;
    } else if (loadingType == Constant.noLoading) {
      loadState = LoadState.success;
      // return;
    }

    if (onStart != null) {
      onStart();
    }

    future.then((value) {
      /// 网络请求成功
      //BaseResponse response = BaseResponse.fromJson(value.body);
      BaseResponse response = dealWithResponse(value);
      //拿到res.data就可以进行Json解析了，这里一般用来构造实体类
      var success = response.success;

      if (success) {
        dismissEasyLoading();

        /// 请求成功
        var data = response.data;
        if (data != null) {
          loadState = LoadState.success;

          /// 在onSuccess()中也要判断具体的业务数据是否为空
          onSuccess(data);
        } else {
          loadState = LoadState.empty;
          dismissEasyLoading();
          onSuccess(data);
        }
        LoggerUtil.e(
            'BaseGetController handleRequest success ====> code: ${response.errorCode}  message: ${response.errorMsg}');
      } else {
        /// 请求失败
        loadState = LoadState.fail;
        dismissEasyLoading();
        // 外部方法在后，可在方法里根据业务更改状态
        onFail(response);
        LoggerUtil.e(
            'BaseGetController handleRequest fail 1 ====> code: ${response.errorCode} message: ${response.errorMsg}');
      }
    }).onError<BaseResponse>((error, stackTrace) {
      /// 网络请求失败
      if (loadingType != Constant.noLoading) {
        // 加载状态设置为fail
        loadState = LoadState.fail;
        // LoadErrorMsg 文字内容
        httpErrorMsg = '${error.errorCode}  ${error.errorMsg}';
      }
      dismissEasyLoading();
      if (onError != null) {
        onError(error);
      }
      LoggerUtil.e(
          'BaseGetController handleRequest onError ====> code: ${error.errorCode} message: ${error.errorMsg}');
    });
  }

  ///处理返回的结果
  BaseResponse dealWithResponse(Response value) {
    if (value.isOk) {
      return BaseResponse.fromJson(value.body);
    } else {
      return ApiErrorHandler().returnErrorBaseResponse(value);
    }
  }

  void dismissEasyLoading() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }
}
