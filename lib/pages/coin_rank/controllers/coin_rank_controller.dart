import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/models/coin_rank_response.dart';
import 'package:flutter_wanandroid/provider/base_refresh_controller.dart';
import 'package:get/get.dart';
import 'package:sprintf/sprintf.dart';
import '../../../provider/request_api.dart';
import '../../../provider/state/load_state.dart';
import '../../../res/constant.dart';

/// 日期：2022-05-28
/// 描述：积分排行榜-控制器
/// 说明：

class CoinRankController extends BaseRefreshController {
  final coinRankLists = <RankData>[].obs;

  @override
  void onReady() {
    super.onReady();
    onFirstInRequestData();
    // provider.coinRank().then((value) {
    //   if (value.success) {
    //     coinRankLists.addAll(CoinRankData.fromJson(value.data).datas);
    //     print('数据请求成功');
    //   } else {
    //     print('数据请求失败');
    //   }
    // });
  }

  ///第一次进入
  void onFirstInRequestData() {
    getCoinList(
        loadingType: Constant.multipleShimmerLoading,
        refreshState: RefreshState.first);
  }

  /// 下拉刷新首页
  void onRefreshRequestData() {
    getCoinList(
        loadingType: Constant.noLoading, refreshState: RefreshState.refresh);
  }

  /// 上滑加载更多
  void onLoadMoreRequestData() {
    getCoinList(
      loadingType: Constant.noLoading,
      refreshState: RefreshState.loadMore,
    );
  }

  Future<void> getCoinList(
      {required String loadingType, required RefreshState refreshState}) async {
    if (refreshState == RefreshState.refresh ||
        refreshState == RefreshState.first) {
      /// 下拉刷新  项目列表数据 页码：拼接在链接中，从1开始。
      currentPage = 1;
    }
    if (refreshState == RefreshState.loadMore) {
      /// 上滑加载更多
      currentPage++;
    }

    String requestUrl = sprintf(RequestAPI.coinRank, [currentPage]);
    httpManagerWithRefreshPaging(
        loadingType: loadingType,
        refreshState: refreshState,
        future: provider.get(requestUrl),
        onSuccess: (response) {
          CoinRankData coinRankData = CoinRankData.fromJson(response);
          List<RankData>? coinDataList = CoinRankData.fromJson(response).datas;

          ///判断是否到底
          if (coinRankData.over) {
            loadNoData();
          }

          ///判断是否有数据
          if (coinDataList.isNotEmpty) {
            loadState = LoadState.success;
            refreshLoadState = LoadState.success;

            if (refreshState == RefreshState.first) {
              coinRankLists.assignAll(coinDataList);
            } else if (refreshState == RefreshState.refresh) {
              coinRankLists.assignAll(coinDataList);
            } else if (refreshState == RefreshState.loadMore) {
              coinRankLists.addAll(coinDataList);
            }
          } else {
            if (loadingType != Constant.noLoading) {
              refreshLoadState = LoadState.empty;
            } else {
              loadNoData();
            }
          }
        },
        onFail: (fail) {
          EasyLoading.showInfo('${fail.errorMsg}');
        },
        onError: (error) {
          EasyLoading.showInfo('${error.errorMsg}');
        });
  }
}
