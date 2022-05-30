import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_wanandroid/models/coin_rank_response.dart';
import 'package:flutter_wanandroid/pages/coin_rank/controllers/coin_rank_controller.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../provider/refresh/refresh_paging_state_page.dart';

/// 日期：2022-05-28
/// 描述：积分排行榜-页面
/// 说明：

class CoinRankView extends GetView<CoinRankController> {
  const CoinRankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('积分排行榜'), centerTitle: true),
        body: Obx(() => RefreshPagingStatePage<CoinRankController>(
            controller: controller,
            onPressed: () => controller.onFirstInRequestData(),
            refreshController: controller.refreshController,
            lottieRocketRefreshHeader: true,
            onRefresh: () => controller.onRefreshRequestData(),
            onLoadMore: () => controller.onLoadMoreRequestData(),
            header: const MaterialClassicHeader(
              color: Colors.red,
            ),
            child: _buildBody())));
  }

  Widget _buildBody() {
    return ListView.builder(
      itemCount: controller.coinRankLists.length,
      itemBuilder: (context, index) {
        final item = controller.coinRankLists[index];
        return _buildItem(item);
      },
    );
  }

  ///每一个Item视图
  Widget _buildItem(RankData item) {
    return GFCard(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      boxFit: BoxFit.contain,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.67), BlendMode.darken),
      content: Column(
        children: [
          Text('排名:${item.rank}'),
          Text('用户名:${item.username}'),
          Text('用户等级:${item.level}'),
          Text('用户积分:${item.coinCount}'),
        ],
      ),
    );
  }
}
