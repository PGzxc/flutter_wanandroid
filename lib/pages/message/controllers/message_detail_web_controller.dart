import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:io';


class MessageDetailWebController extends BaseController{
  /// 收藏动画显示与否
  final _collectAnimation = false.obs;
  get collectAnimation => _collectAnimation.value;
  set collectAnimation(value) => _collectAnimation.value = value;

  /// 取消收藏动画显示与否
  final _unCollectAnimation = false.obs;
  get unCollectAnimation => _unCollectAnimation.value;
  set unCollectAnimation(value) => _unCollectAnimation.value = value;

  late WebViewController webViewController;

  /////进度条
  final _webProgress = 0.0.obs;
  get webProgress => _webProgress.value;
  set webProgress(value) => _webProgress.value = value;

  /// 第一次进入WebView显示加载页面
  final _isFirstInitWeb = true.obs;
  get isFirstInitWeb => _isFirstInitWeb.value;
  set isFirstInitWeb(value) => _isFirstInitWeb.value = value;

  /// 当前网页Title
  String? currentTitle;

  // 当前页面链接
  var currentPageUrl = "";
  // 收藏、取消收藏接口路径
  late String requestURL;
  late Future<Response<dynamic>> future;

  @override
  void onInit() {
    super.onInit();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  /// WebView加载页面进度
  void updateWebProgress(int progress) {
    webProgress = (progress / 100).toDouble();
    webCanBack();
  }

  //WebView创建时回调
  Future<void> onWebViewCreated(WebViewController controller) async {
    //WebView控制器，通过WebViewController可以实现Web内的前进、后退等操作
    webViewController = controller;
  }

  void reloadWebView() {
    // 刷新页面
    webViewController.reload();
  }

  void onPageStarted(String url, String link) {
    webCanBack();
    // 显示加载动画页面
    unCollectAnimation = true;

  }

  void onPageFinished(String url, String link) {
    webCanBack();
    // 关闭加载动画页面
    unCollectAnimation = false;
    // 当前页面链接
    currentPageUrl = url;
  }

  void onWebResourceError(WebResourceError error, String url, String link) {
    webCanBack();
    // 关闭加载动画页面
    unCollectAnimation = false;

  }

  Future<bool> onWillPop() async {
    //点击返回键时回调
    if (await webViewController.canGoBack()) {
      //如果WebView可以返回
      webViewController.goBack();
      //WebView返回，界面不返回
      return false;
    } else {
      //否则界面返回，且恢复第一次进入标志
      isFirstInitWeb = true;
      return true;
    }
  }

  Future<void> webCanBack() async {
    currentTitle = await webViewController.getTitle();
    if (await webViewController.canGoBack()) {
      // Web页面可以返回，非首页
      isFirstInitWeb = false;
    } else {
      // Web页面不可以返回，首页
      isFirstInitWeb = true;
    }
  }

}