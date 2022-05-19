import 'package:flutter_wanandroid/pages/language/controllers/language_controller.dart';
import 'package:get/instance_manager.dart';

class LanguageBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => LanguageController());
  }

}