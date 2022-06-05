import 'package:flutter_wanandroid/pages/message/controllers/message_controller.dart';
import 'package:flutter_wanandroid/pages/message/controllers/message_detail_web_controller.dart';
import 'package:flutter_wanandroid/pages/message/controllers/message_read_list_controller.dart';
import 'package:flutter_wanandroid/pages/message/controllers/message_unread_list_controller.dart';
import 'package:get/get.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => MessageController());
    Get.lazyPut(() => MessageUnreadListController());
    Get.lazyPut(() => MessageReadListController());


  }
}
