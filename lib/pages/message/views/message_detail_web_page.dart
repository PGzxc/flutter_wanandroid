import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_wanandroid/models/message_read_list_response.dart';
import 'package:flutter_wanandroid/pages/message/controllers/message_detail_web_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../res/app_color.dart';

/// 描述: 消息Web页面

class MessageDetailWebPage extends GetView<MessageDetailWebController> {
  const MessageDetailWebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    final Message model = arguments['data'];
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: webViewContainer(context, model),
      ),
      onWillPop: () => controller.onWillPop(),
    );
  }

  Stack webViewContainer(BuildContext context, Message model) {
    var url = '';
    if (model.fullLink.isNotEmpty) {
      url = model.fullLink;
    }
    return Stack(
      children: [
        WebView(
          allowsInlineMediaPlayback: true,
          zoomEnabled: true,
          // 默认禁止js
          javascriptMode: JavascriptMode.unrestricted,
          // 初始url
          initialUrl: url,
          gestureNavigationEnabled: true,
          onWebViewCreated: (webController) {
            controller.onWebViewCreated(webController);
          },
          // 页面开始加载时
          onPageStarted: (String url) async {
            controller.onPageStarted(url, model.link);
          },
          onProgress: (int progress) {
            // WebView加载页面进度
            controller.updateWebProgress(progress);
          },
          onPageFinished: (url) async {
            controller.onPageFinished(url, model.link);
          },
          navigationDelegate: (NavigationRequest request) {
            if (!request.url.contains('http')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onWebResourceError: (WebResourceError error) {
            controller.onWebResourceError(error, url, model.link);
          },
        ),
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
      ],
    );
  }
}
