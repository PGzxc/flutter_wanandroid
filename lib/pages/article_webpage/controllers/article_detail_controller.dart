import 'dart:async';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/models/home_article_response.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:flutter_wanandroid/provider/request_api.dart';
import 'package:flutter_wanandroid/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:sprintf/sprintf.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../res/constant.dart';
import '../../../utils/logger/logger_util.dart';

/// 类名: article_detail_controller.dart
/// 创建日期: 11/29/21 on 1:50 PM
/// 描述: 文章详情控制器


class ArticleDetailController extends BaseController {
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
    LoggerUtil.d('==========> onPageStarted1 当前页面链接: $url');
    LoggerUtil.d('==========> onPageStarted2 原文链接: $link');
  }

  void onPageFinished(String url, String link) {
    webCanBack();
    // 关闭加载动画页面
    unCollectAnimation = false;
    LoggerUtil.d('==========> onPageFinished1 当前页面链接: $url');
    LoggerUtil.d('==========> onPageFinished2 原文链接: $link');
    // 当前页面链接
    currentPageUrl = url;
  }

  void onWebResourceError(WebResourceError error, String url, String link) {
    webCanBack();
    // 关闭加载动画页面
    unCollectAnimation = false;
    LoggerUtil.d('==========> onWebResourceError1 当前页面链接: $url');
    LoggerUtil.d('==========> onWebResourceError2 原文链接: $link');
    LoggerUtil.d(
        '==========> onWebResourceError3 ${error.description}  ${error.errorType}  ${error.failingUrl}');
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
    LoggerUtil.d('==========> onPageFinished3 title: $currentTitle');

    if (await webViewController.canGoBack()) {
      // Web页面可以返回，非首页
      isFirstInitWeb = false;
    } else {
      // Web页面不可以返回，首页
      isFirstInitWeb = true;
    }
    LoggerUtil.d('==========> isFirstInitWeb $isFirstInitWeb');
  }

  /// 收藏网站  collectLink
  void requestCollectLink({
    Function()? onStart,
    Function()? onSuccess,
    Function()? onFail,
  }) async {
    // 收藏网址(HTML页面内跳转链接后的页面进行收藏)
    //var collectLinkUrl = RequestApi.collectLink;
    var collectLinkUrl = RequestAPI.collectSite;

    /// 当前状态为未收藏时，点击发送收藏请求，反之，发送取消收藏请求
    requestURL = collectLinkUrl;

    var postCollectLinkUrlParams = {
      "name": currentTitle,
      "link": currentPageUrl,
    };

    if (!isLogin) {
      Get.toNamed(Routes.loginRegister.nameToRoute());
      return;
    }

    httpManager(
      loadingType: Constant.noLoading,
      // 此接口使用sprintf插件进行String格式化操作  static const String collectInsideArticle = '/lg/collect/%s/json';
      // future: DioUtil().request(requestURL, method: DioMethod.post),
      future: provider.post(requestURL, {}, query: postCollectLinkUrlParams),
      onStart: () {
        // 显示收藏动画
        collectAnimation = true;
      },
      onSuccess: (response) async {
        await Future.delayed(const Duration(milliseconds: 1000));
        // 收藏请求成功 隐藏收藏动画
        collectAnimation = false;
        EasyLoading.showToast('收藏网址成功');
      },
      onFail: (value) async {
        // 收藏请求失败 隐藏收藏动画
        collectAnimation = false;
        EasyLoading.showToast('收藏网址失败');
      },
      onError: (value) {
        collectAnimation = false;
        EasyLoading.showToast('收藏网址请求异常');
      },
    );
  }

  /// 收藏、取消收藏（站内文章）  collectInsideArticle
  void requestCollectArticle(Article model) async {
    // 获取文章列表可观察变量 isCollect 是否收藏状态
    //var currentCollectState = model.isCollect;
    var currentCollectState = model.collect;

    // 收藏站内文章
    var collectInsideArticleUrl =
        sprintf(RequestAPI.collectInSideArticle, [model.id]);

    /// 当前状态为未收藏时，点击发送收藏请求，反之，发送取消收藏请求
    if (currentCollectState == false) {
      future = provider.post(collectInsideArticleUrl, {});
    } else {
      if (model.origin == null) {
        // 文章列表取消收藏
        future = provider
            .post(sprintf(RequestAPI.unCollectArticleList, [model.id]), {});
      } else {
        // 我的收藏页面取消收藏
        var postUnCollectInsideArticle2Params = {
          "originId": model.origin,
        };

        /// FormData参数
        future = provider.post(
            sprintf(RequestAPI.unCollectArticle, [model.id]), {},
            query: postUnCollectInsideArticle2Params);
      }
    }

    if (!isLogin) {
      Get.toNamed(Routes.loginRegister.nameToRoute());
      return;
    }

    httpManager(
      loadingType: Constant.noLoading,
      // 此接口使用sprintf插件进行String格式化操作  static const String collectInsideArticle = '/lg/collect/%s/json';
      // future: DioUtil().request(requestURL, method: DioMethod.post),
      future: future,
      onStart: () {
        /// 点击之前状态为 未收藏 时 假状态
        if (currentCollectState == false) {
          // 显示收藏动画
          collectAnimation = true;
          //model.isCollect = true;
          model.collect = true;
        } else {
          /// 点击之前状态为 已收藏 时 假状态
          // 显示加载动画
          unCollectAnimation = true;
          //model.isCollect = false;
          model.collect = false;
        }
      },
      onSuccess: (response) async {
        await Future.delayed(const Duration(milliseconds: 1000));

        /// 点击之前状态为 未收藏 时
        if (currentCollectState == false) {
          // 收藏请求成功 隐藏收藏动画
          collectAnimation = false;
          //model.isCollect = true;
          model.collect = true;
          EasyLoading.showToast('收藏成功');
        } else {
          /// 点击之前状态为 已收藏 时
          // 取消收藏请求成功
          // 隐藏显示加载动画
          unCollectAnimation = false;
          //model.isCollect = false;
          model.collect = false;
          EasyLoading.showToast('取消收藏成功');
        }
      },
      onFail: (value) async {
        /// 点击之前状态为 未收藏 时 恢复状态
        if (currentCollectState == false) {
          // 收藏请求失败 隐藏收藏动画
          collectAnimation = false;
         // model.isCollect = false;
          model.collect = false;
          EasyLoading.showToast('收藏失败');
        } else {
          /// 点击之前状态为 已收藏 时  恢复状态
          // 取消收藏请求失败
          // 隐藏显示加载动画
          unCollectAnimation = false;
          //model.isCollect = true;
          model.collect = true;
          EasyLoading.showToast('取消收藏失败');
        }
      },
      onError: (value) {
        /// 点击之前状态为 未收藏 时 恢复状态
        if (currentCollectState == false) {
          //收藏请求失败  隐藏收藏动画
          //model.isCollect = false;
          model.collect = false;
          collectAnimation = false;
          EasyLoading.showToast('收藏失败');
        } else {
          /// 点击之前状态为 已收藏 时  恢复状态
          // 取消收藏请求失败
          // 隐藏显示加载动画
          unCollectAnimation = false;
          //model.isCollect = true;
          model.collect = true;
          EasyLoading.showToast('取消收藏失败');
        }
      },
    );
  }
}
