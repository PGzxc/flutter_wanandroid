import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/models/coin_list_response.dart';
import 'package:flutter_wanandroid/pages/coin_list/controllers/coin_list_controller.dart';
import 'package:flutter_wanandroid/res/app_theme.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../provider/refresh/refresh_paging_state_page.dart';

class CoinListView extends GetView<CoinListController> {
  const CoinListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: const Text('个人积分获取列表'), centerTitle: true),
        body: Obx(() => RefreshPagingStatePage<CoinListController>(
            controller: controller,
            onPressed: () => controller.onFirstInRequestData(),
            refreshController: controller.refreshController,
            onRefresh: () => controller.onRefreshRequestData(),
            onLoadMore: () => controller.onLoadMoreRequestData(),
            lottieRocketRefreshHeader: false,
            //header: const MaterialClassicHeader(color: Colors.red,),
            header: const ClassicHeader(),
            child: _buildBody(context))));
  }

  ///视图列表
  Widget _buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: controller.coinLists.length,
      itemBuilder: (context, index) {
        final item = controller.coinLists[index];
        return _buildItem(item,context);
      },
    );
  }

  ///每一个Item视图
  Widget _buildItem(CoinData item,BuildContext context) {
    return GFCard(
      color: context.colorItemBackground,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      boxFit: BoxFit.contain,
      content: Column(
        children: [
          Text('类型：${item.reason}'),
          Text('获得积分：${item.coinCount}'),
          Text(item.desc),
        ],
      ),
    );
  }
}
