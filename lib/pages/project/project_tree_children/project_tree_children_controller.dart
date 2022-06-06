
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/models/home_article_response.dart';
import 'package:flutter_wanandroid/models/project_article_response.dart';
import 'package:flutter_wanandroid/provider/base_refresh_controller.dart';
import 'package:flutter_wanandroid/provider/request_api.dart';
import 'package:get/get.dart';
import 'package:sprintf/sprintf.dart';

import '../../../provider/state/load_state.dart';
import '../../../res/constant.dart';

class ProjectTreeChildrenController extends BaseRefreshController {
  final Rx<int?> cid = 0.obs;

  final projectTreeArticleList = RxList<Article>();

  void setCid(int? id) {
    cid.value = id;
  }

  @override
  void onInit() {
    super.onInit();

    loadState = LoadState.lottieRocketLoading;
    // 项目列表数据 页码：拼接在链接中，从1开始
    currentPage = 1;

    // ever(isLogin, (callback) {
    //   onRefreshRequestData();
    //   // 定位到顶部
    //   if (scrollController.hasClients) {
    //     scrollController.jumpTo(0);
    //   }
    // });
  }

  /// 第一次进入
  void onFirstInRequestData() {
    initProjectChildrenArticleListData(
      loadingType: Constant.multipleShimmerLoading,
      refreshState: RefreshState.first,
      cid: cid.value,
    );
  }

  /// 下拉刷新首页
  void onRefreshRequestData() {
    initProjectChildrenArticleListData(
      loadingType: Constant.noLoading,
      refreshState: RefreshState.refresh,
      cid: cid.value,
    );
  }

  /// 上滑加载更多
  void onLoadMoreRequestData() {
    initProjectChildrenArticleListData(
      loadingType: Constant.noLoading,
      refreshState: RefreshState.loadMore,
      cid: cid.value,
    );
  }

  /// 项目分类下的文章
  Future<void> initProjectChildrenArticleListData({
    required String loadingType,
    required RefreshState refreshState,
    required int? cid,
  }) async {
    if (refreshState == RefreshState.refresh ||
        refreshState == RefreshState.first) {
      /// 下拉刷新  项目列表数据 页码：拼接在链接中，从1开始。
      currentPage = 1;
    }
    if (refreshState == RefreshState.loadMore) {
      /// 上滑加载更多
      currentPage++;
    }

    String requestUrl = sprintf(RequestAPI.projectArticleList, [currentPage,cid]);

    httpManagerWithRefreshPaging(
      loadingType: loadingType,
      refreshState: refreshState,
      future:provider.get(requestUrl),

      onSuccess: (response) {
        var articleDataModel = ProjectData.fromJson(response);
        List<Article>? dataList = articleDataModel.datas;

        // 加载到底部判断
        var over = articleDataModel.over;
        if (over != null) {
          if (over) {
            loadNoData();
          }
        }

        if (dataList != null && dataList.isNotEmpty) {
          loadState = LoadState.success;
          refreshLoadState = LoadState.success;

          /// 循环遍历 装载 可观察变量 isCollect
          for (var element in dataList) {
            var collect = element.collect;

          }

          if (refreshState == RefreshState.first) {
            projectTreeArticleList.assignAll(dataList);
          } else if (refreshState == RefreshState.refresh) {
            projectTreeArticleList.assignAll(dataList);
          } else if (refreshState == RefreshState.loadMore) {
            projectTreeArticleList.addAll(dataList);
          }
        } else {
          if (loadingType != Constant.noLoading) {
            refreshLoadState = LoadState.empty;
          } else {
            loadNoData();
          }
        }
      },
      onFail: (value) {
        EasyLoading.showError("${value.errorMsg}");
      },
      onError: (error) {
        EasyLoading.showError("${value.errorMsg}");
      },
    );
  }
}
