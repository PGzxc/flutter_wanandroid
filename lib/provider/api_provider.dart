import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/pages/login_register/controllers/login_register_controller.dart';
import 'package:flutter_wanandroid/provider/base_response.dart';
import 'package:flutter_wanandroid/provider/request_api.dart';
import 'package:flutter_wanandroid/utils/cookie_utils.dart';
import 'package:get/get.dart';
import 'base_api_services.dart';
import 'error_handler.dart';

class ApiProvider extends GetConnect with BaseApiServices {
  static const String _API_KEY = '595a430e1e364be4952d4ceba47f6db1';

  // static final ApiProvider _singleton = ApiProvider._internal();
  // factory ApiProvider() {
  //   return _singleton;
  // }
  // ApiProvider._internal();

  final RxString _connectionStatus = ''.obs;
  final Connectivity _connectivity = Connectivity();

  //For subscription to the ConnectivityResult stream
  late StreamSubscription<ConnectivityResult> _connectionSubscription;

  String get connectionStatus => _connectionStatus.value;

  @override
  void onInit() {
    httpClient.baseUrl = RequestAPI.baseURL;
    httpClient.timeout = const Duration(seconds: 5);
    //httpClient.addRequestModifier((request) => null);

    ///请求拦截-获取Cookie作为请求头
    httpClient.addRequestModifier<dynamic>((request) async {
      //await Future.delayed(const Duration(seconds: 1));
      String? cookie = CookieUtils.getCookie();
      cookie == null ? null : request.headers['Cookie'] = cookie;
      return request;
    });
    httpClient.addResponseModifier((request, response) async {
      //request.headers['x-api-key'] = '595a430e1e364be4952d4ceba47f6db1';
      // ///请求Cookie
      // String? cookie = CookieUtils.getCookie()!;
      // request.headers['Cookie']=cookie;

      ///保存cookie
      _saveCookies(response);
      ///await Future.delayed(const Duration(seconds: 1));
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
        '╟ REQUEST ║ ${request.method.toUpperCase()}\n'
        '╟ url: ${request.url}\n'
        '╟ Headers: ${request.headers}\n'
        //'╟ Body: ${request.bodyBytes.map((event) => event.asMap().toString()) ?? ''}\n'
        '╟ Status Code: ${response.statusCode}\n'
        '╟ Data: ${response.bodyString?.toString() ?? ''}'
        '\n╚══════════════════════════ Response ══════════════════════════\n',
        wrapWidth: 1024,
      );
      return response;
    });

    initConnectivity();
    _connectionSubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatus.value = result.toString();
      if (_connectionStatus.value == "ConnectivityResult.mobile" ||
          _connectionStatus.value == "ConnectivityResult.wifi") {
        //Handler().getInternetSnackBar();
      } else {
        //Handler().noInternetSnackBar();
      }
    });
  }

  ///保存Cookie信息-用于接口请求时作为Head请求头
  Future<void> _saveCookies(Response response) async {
    if (response.headers == null ||
        !response.headers!.containsKey(HttpHeaders.setCookieHeader)) return;
    String? setCookie = response.headers![HttpHeaders.setCookieHeader];
    if (setCookie!.contains('token')) {
      CookieUtils.saveCookie(setCookie);
    }
  }

  Future<void> initConnectivity() async {
    String connectionStatus;
    try {
      connectionStatus = (await _connectivity.checkConnectivity()).toString();
    } on PlatformException catch (e) {
      connectionStatus = "Internet connectivity failed";
    }
    _connectionStatus.value = connectionStatus;
    print("InitConnectivity : $_connectionStatus");
    // ignore: unrelated_type_equality_checks
    if (_connectionStatus.value == "ConnectivityResult.mobile" ||
        _connectionStatus.value == "ConnectivityResult.wifi") {
      // Get.snackbar('No InterNet', "You are not connected to internet");
    } else {
      print('No Internet');
      Get.snackbar('No InterNet', "You are not connected to internet",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Future<dynamic> getNews() async {
    final response = await get(
      'top-headlines?country=in&apiky=$_API_KEY',
      // decoder: (data) => News.fromJson(data),
    );
    if (response.isOk) {
      return null;
      //return News.fromJson(response.body);
    } else {
      return ApiErrorHandler().returnErrorString(response);
    }
  }

  @override
  Future<Response> getEverthing(String s) async {
    final response = await get('everything?q=$s&apiKey=$_API_KEY',
        // headers: {
        //   "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        //   "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS
        //   "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        //   "Access-Control-Allow-Methods": "POST, OPTIONS,GET"
        // },
        //decoder: (data) => News.fromJson(data),
        decoder: (data) => data);
    return response;
  }

  ///5.1 5.2-登陆和注册
  @override
  Future<BaseResponse> loginRegister(
      String request, Map<String, String> paramsMap) async {
    final response = await post(
        request == ButtonType.login.toString()
            ? RequestAPI.login
            : RequestAPI.register,
        {},
        query: paramsMap);
    return dealWithResponse(response);
  }
  /// 5.3-退出登陆
  @override
  Future<BaseResponse> logout() async{
    final response = await get(RequestAPI.logout);
    return dealWithResponse(response);
  }
  ///9.3-获取个人积分获取列表，需要登录后访问
  @override
  Future<BaseResponse> coinList() async {
    final response = await post(RequestAPI.coinList, {});
    return dealWithResponse(response);
  }

  ///9.1-积分排行榜接口
  @override
  Future<BaseResponse> coinRank() async {
    final response = await get(RequestAPI.coinRank);
    return dealWithResponse(response);
  }

  ///9.2-获取个人积分，需要登录后访问
  @override
  Future<BaseResponse> coinUserInfo() async {
    final response = await get(RequestAPI.coinUserInfo);
    return dealWithResponse(response);
  }

  ///12-获取用户信息
  Future<BaseResponse> userInfo() async{
    final response = await get(RequestAPI.userInfo);
    return dealWithResponse(response);
  }


  ///统一处理网络返回
  dynamic dealWithResponse(response) {
    if (response.isOk) {
      return BaseResponse.fromJson(response.body);
    } else {
      return ApiErrorHandler().returnErrorBaseResponse(response);
    }
  }


}
