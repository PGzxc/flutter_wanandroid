import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/main/controllers/main_controller.dart';
import 'package:flutter_wanandroid/pages/message/views/message_read_list_view.dart';
import 'package:flutter_wanandroid/pages/message/views/message_unread_list_view.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:flutter_wanandroid/provider/request_api.dart';
import 'package:flutter_wanandroid/res/constant.dart';
import 'package:get/instance_manager.dart';

import '../../../widgets/keep_alive_wrapper.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-Message-页面
/// 说明：
class MessageController extends BaseController {

  late TabController tabController;
  late List<Widget> tabPageBodies;

  final tabValues = ['未读消息列表', '已读消息列表'];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabValues.length, initialIndex: 0, vsync: this);
    tabPageBodies = <Widget>[
      const KeepAliveWrapper(
        keepAlive: true,
        child: MessageUnreadListView(),
      ),
      const KeepAliveWrapper(
        keepAlive: true,
        child: MessageReadListView(),
      )
    ];

  }

  ///获取未读消息接口
  // Future<dynamic> getUnReadMessageResponse() async {
  //   httpManager(
  //       loadingType: Constant.noLoading,
  //       future: provider.get(RequestAPI.messageUnread),
  //       onSuccess: (value) {
  //         ///消息赋值
  //         MainController mainController = Get.put(MainController());
  //         mainController.messageNum = value;
  //       },
  //       onFail: (fail) {},
  //       onError: (error) {});
  // }
}
