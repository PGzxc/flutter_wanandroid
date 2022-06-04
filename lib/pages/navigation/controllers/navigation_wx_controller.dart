import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/models/wx_article_history_response.dart';
import 'package:flutter_wanandroid/provider/base_refresh_controller.dart';
import 'package:flutter_wanandroid/provider/request_api.dart';
import 'package:flutter_wanandroid/res/constant.dart';
import 'package:get/get.dart';
import 'package:sprintf/sprintf.dart';

import '../../../models/home_article_response.dart';
import '../../../models/wx_article_list_response.dart';
import '../../../provider/state/load_state.dart';

///日期：2022-06-03
///描述：导航-公众号-控制器
class NavigationWxController extends BaseRefreshController {
  ///左侧导航数据
  final leftDataList = RxList<WXItem>();
  ///左侧选中的Item
  final currentWXItem = WXItem().obs;

  ///根据左侧id和page查询到到右侧历史数据
  final rightData = WXHistoryData().obs;
  ///右侧文章列表
  final rightArticleList = RxList<Article>();


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initLeftNavigationData();
  }

  Future<void> initLeftNavigationData() async {
    httpManager(
        loadingType: Constant.showLoadingDialog,
        future: provider.get(RequestAPI.wxArticleList),
        onSuccess: (value) {
          List<WXItem> leftTransList =
          (value as List<dynamic>).map((e) => WXItem.fromJson(e)).toList();
          leftDataList.assignAll(leftTransList);
          currentWXItem.value = leftTransList[0];
          ///获取右侧公众号历史数据
          onFirstInWXData();
        },
        onFail: (fail) {},
        onError: (error) {});

  }

  /// 点击切换导航
  void changeNavigation(WXItem wxItem) {
    currentWXItem.value=wxItem;
    getWXArticleList(Constant.showLoadingDialog, RefreshState.refresh, wxItem);
  }

  ///获取右侧公众号历史数据
  Future<void> getWXHistoryData(
      {required String loadingType,
      required RefreshState refreshState,
      required WXItem wxItem}) async {
    if (refreshState == RefreshState.refresh ||
        refreshState == RefreshState.first) {
      /// 下拉刷新
      currentPage = 1;
    }
    if (refreshState == RefreshState.loadMore) {
      /// 上滑加载更多
      currentPage++;
    }
    // 获取首页文章列表
    getWXArticleList(loadingType, refreshState, wxItem);
  }

  /// 第一次进入首页
  void onFirstInWXData() {
    getWXHistoryData(
        loadingType: Constant.showLoadingDialog,
        refreshState: RefreshState.first,
        wxItem: currentWXItem.value);
  }

  /// 下拉刷新首页
  void onRefreshWXData() {
    getWXHistoryData(
        loadingType: Constant.noLoading,
        refreshState: RefreshState.refresh,
        wxItem: currentWXItem.value);
  }

  /// 上滑加载更多
  void onLoadMoreWXData() {
    getWXHistoryData(
        loadingType: Constant.noLoading,
        refreshState: RefreshState.loadMore,
        wxItem: currentWXItem.value);
  }

  Future<void> getWXArticleList(String loadingType, RefreshState refreshState, WXItem wxItem) async {
    /// 参数：页码，拼接在连接中，从0开始。
    String requestUrl = sprintf(RequestAPI.wxArticleHistoryList, [wxItem.id, currentPage]);

    httpManagerWithRefreshPaging(
      loadingType: loadingType,
      refreshState: refreshState,
      future: provider.get(requestUrl),
      onSuccess: (value) {
        WXHistoryData wxHistoryData = WXHistoryData.fromJson(value);
        var dataList = wxHistoryData.datas!;

        // 加载到底部判断
        var over = wxHistoryData.over;
        if (over != null) {
          if (over) {
            loadNoData();
          }
        }
        if (dataList.isNotEmpty) {
          refreshLoadState = LoadState.success;
          if (refreshState == RefreshState.first) {
            rightArticleList.assignAll(dataList);
          } else if (refreshState == RefreshState.refresh) {
            rightArticleList.assignAll(dataList);
          } else if (refreshState == RefreshState.loadMore) {
            rightArticleList.addAll(dataList);
          }
        } else {
          if (loadingType != Constant.noLoading) {
            refreshLoadState = LoadState.empty;
          } else {
            loadNoData();
          }
        }
      },
      onFail: (error) {
        refreshLoadState = LoadState.fail;
        EasyLoading.showToast('数据请求失败 ${error.errorCode}  ${error.errorMsg}');
      },
      onError: (error) {
        refreshLoadState = LoadState.fail;
        EasyLoading.showToast('数据请求失败 ${error.errorCode}  ${error.errorMsg}');
      },
    );
  }
}
