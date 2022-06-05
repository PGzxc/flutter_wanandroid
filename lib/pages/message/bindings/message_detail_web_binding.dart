import 'package:get/get.dart';

import '../controllers/message_detail_web_controller.dart';

class MessageDetailWebBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MessageDetailWebController());
  }

}