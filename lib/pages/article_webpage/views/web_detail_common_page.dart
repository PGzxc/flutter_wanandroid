import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/models/collect_site_list_response.dart';
import 'package:get/get.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../../provider/state/favorite_lottie_widget.dart';
import '../../../provider/state/loading_lottie_rocket_widget.dart';
import '../../../res/app_color.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../collect_link_list/controllers/collect_link_list_controller.dart';
import '../controllers/article_detail_controller.dart';

/// 类名: article_detail_page.dart
/// 描述: 文章详情Web页面Common

class WebDetailCommonPage extends GetView<ArticleDetailController> {
  const WebDetailCommonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final collectLinkController = Get.find<CollectLinkListController>();

    var arguments = Get.arguments;
    final CollectSite model = arguments['data'];

    return WillPopScope(
      child: Scaffold(
        appBar: CustomAppBar(
          centerTitle: model.name ?? "收藏链接",
          actionIcon: Obx(() {
            return Icon(
              Icons.favorite,
              size: 24,
              color: model.isCollect
                  ? Colors.red
                  : Colors.grey.withOpacity(0.5),
            );
          }),
          onRightPressed: () {
            if (model.isCollect) {
              // 已收藏状态，点击取消收藏
              collectLinkController.requestUnCollectLink(
                model: model,
                onStart: () {
                  // 显示取消收藏动画
                  controller.unCollectAnimation = true;
                },
                onSuccess: (model) {
                  // 隐藏取消收藏动画
                  controller.unCollectAnimation = false;
                  EasyLoading.showToast('取消收藏成功');
                },
                onFail: (model) {
                  // 隐藏取消收藏动画
                  controller.unCollectAnimation = false;
                  EasyLoading.showToast('取消收藏失败');
                },
              );
            } else {
              // 未收藏状态，点击收藏
              controller.requestCollectLink(
                onStart: () {
                  // 显示收藏动画
                  controller.collectAnimation = true;
                },
                onSuccess: () {
                  // 隐藏收藏动画
                  controller.collectAnimation = false;
                  EasyLoading.showToast('收藏成功');
                },
                onFail: () {
                  // 隐藏收藏动画
                  controller.collectAnimation = false;
                  EasyLoading.showToast('收藏失败');
                },
              );
            }
          },
        ),
        body: webViewContainer(context, model),
      ),
      onWillPop: () => controller.onWillPop(),
    );
  }

  Stack webViewContainer(BuildContext context, CollectSite model) {
    var url = '';
    if (model.link != null) {
      if (model.link!.isNotEmpty) {
        url = model.link!;
      }
    }
    return Stack(
      children: [
        InAppWebView(
          onWebViewCreated: (controller) async {
            this.controller.webViewController = controller;
            await controller.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
          },
        ),
        // WebView(
        //   allowsInlineMediaPlayback: true,
        //   zoomEnabled: true,
        //   // 默认禁止js
        //   javascriptMode: JavascriptMode.unrestricted,
        //   // 初始url
        //   initialUrl: url,
        //   gestureNavigationEnabled: true,
        //   onWebViewCreated: (webController) {
        //     controller.onWebViewCreated(webController);
        //   },
        //   // 页面开始加载时
        //   onPageStarted: (String url) async {
        //     controller.onPageStarted(url, model.link ?? "");
        //   },
        //   onProgress: (int progress) {
        //     // WebView加载页面进度
        //     controller.updateWebProgress(progress);
        //   },
        //   onPageFinished: (url) async {
        //     controller.onPageFinished(url, model.link ?? "");
        //   },
        //   navigationDelegate: (NavigationRequest request) {
        //     if (!request.url.contains('http')) {
        //       return NavigationDecision.prevent;
        //     }
        //     return NavigationDecision.navigate;
        //   },
        //   onWebResourceError: (WebResourceError error) {
        //     controller.onWebResourceError(error, url, model.link ?? "");
        //   },
        // )
        Obx(() {
          // WebView加载页面进度
          return Visibility(
            visible: controller.webProgress < 1,
            child: LinearProgressIndicator(
              minHeight: 1,
              backgroundColor: AppColors.bgColor,
              color: AppColors.iconLightColor,
              value: controller.webProgress,
            ),
          );
        }),
        Obx(() {
          /// 收藏动画
          return Positioned(
            top: Get.height / 5,
            left: 0,
            right: 0,
            child: FavoriteLottieWidget(
              visible: controller.collectAnimation,
              animate: controller.collectAnimation,
              repeat: false,
              width: Get.width,
              height: Get.height / 3,
            ),
          );
        }),
        Obx(() {
          return Positioned(
            top: Get.height / 5,
            left: 0,
            right: 0,
            child: LoadingLottieRocketWidget(
              visible: controller.unCollectAnimation,
              animate: controller.unCollectAnimation,
              repeat: false,
              width: Get.width,
              height: Get.height / 3,
            ),
          );
        }),
      ],
    );
  }
}
