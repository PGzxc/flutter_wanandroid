import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/models/coin_list_response.dart';
import 'package:flutter_wanandroid/res/constant.dart';
import 'package:get/get.dart';
import 'package:sprintf/sprintf.dart';
import '../../../provider/base_refresh_controller.dart';
import '../../../provider/request_api.dart';
import '../../../provider/state/load_state.dart';

class CoinListController extends BaseRefreshController {
  //final coinLists = <CoinData>[].obs;
  final coinLists = RxList<CoinData>();

  @override
  void onReady() {
    super.onReady();
    onFirstInRequestData();
    // provider.coinList().then((value) {
    //   if (value.success) {
    //     print('成功');
    //     coinLists.addAll(CoinListData.fromJson(value.data).datas);
    //   } else {
    //     print('失败');
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

    String requestUrl = sprintf(RequestAPI.coinList, [currentPage]);
    httpManagerWithRefreshPaging(
        loadingType: loadingType,
        refreshState: refreshState,
        future: provider.get(requestUrl),
        onSuccess: (response) {
          CoinListData coinListData = CoinListData.fromJson(response);
          List<CoinData>? coinDataList = CoinListData.fromJson(response).datas;

          ///判断是否到底
          if (coinListData.over) {
            loadNoData();
          }

          ///判断是否有数据
          if (coinDataList != null && coinDataList.isNotEmpty) {
            refreshLoadState = LoadState.success;

            if (refreshState == RefreshState.first) {
              coinLists.assignAll(coinDataList);
            } else if (refreshState == RefreshState.refresh) {
              coinLists.assignAll(coinDataList);
            } else if (refreshState == RefreshState.loadMore) {
              coinLists.addAll(coinDataList);
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
          refreshLoadState = LoadState.success;
          EasyLoading.showInfo('${fail.errorMsg}');
        },
        onError: (error) {
          refreshLoadState = LoadState.success;
          EasyLoading.showInfo('${error.errorMsg}');
        });
  }
}
