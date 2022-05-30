import 'package:flutter_wanandroid/pages/coin_rank/controllers/coin_rank_controller.dart';
import 'package:get/get.dart';

/// 日期：2022-05-28
/// 描述：积分排行榜-binding
/// 说明：

class CoinRankBinging extends Bindings{
  @override
  void dependencies() {
     Get.lazyPut(() => CoinRankController());
  }
}