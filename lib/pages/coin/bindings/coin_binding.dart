import 'package:flutter_wanandroid/pages/coin/controllers/coin_controller.dart';
import 'package:get/get.dart';

class CoinBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoinController());
  }
}
