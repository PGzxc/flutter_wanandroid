import 'package:flutter_wanandroid/pages/setting/controllers/setting_controller.dart';
import 'package:get/instance_manager.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => SettingController());
  }

}