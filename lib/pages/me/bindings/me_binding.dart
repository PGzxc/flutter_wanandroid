import 'package:flutter_wanandroid/pages/login_register/utils/login_register_utils.dart';
import 'package:get/get.dart';
import '../controllers/me_controller.dart';

class MeBinding extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() => MeController());

  }
}