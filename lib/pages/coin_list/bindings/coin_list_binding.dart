import 'package:flutter_wanandroid/pages/coin_list/controllers/coin_list_controller.dart';
import 'package:get/get.dart';

class CoinListBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => CoinListController());

  }

}