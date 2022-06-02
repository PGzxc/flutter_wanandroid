import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/models/home_article_response.dart';
import 'package:flutter_wanandroid/models/home_banner_response.dart';
import 'package:flutter_wanandroid/provider/base_refresh_controller.dart';
import 'package:flutter_wanandroid/provider/request_api.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sprintf/sprintf.dart';
import '../../../provider/state/load_state.dart';
import '../../../res/constant.dart';
import '../../../utils/logger/logger_util.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-home-控制器
/// 说明：将BaseController替换为BaseRefreshController，可刷新的Controller
class HomeController extends BaseRefreshController {
  ///Banner 图片数据
  final homeBannerList = RxList<Banner>();

  ///首页文章列表
  final homeArticleList = RxList<HomeArticle>();

  @override
  void onInit() {
    super.onInit();
    onFirstInHomeData();
  }

  /// 第一次进入首页
  void onFirstInHomeData() {
    LoggerUtil.d('============> onFirstInHomeData()', tag: 'HomeController');
    getHomeData(
      loadingType: Constant.simpleShimmerLoading,
      refreshState: RefreshState.first,
    );
  }

  /// 下拉刷新首页
  void onRefreshHomeData() {
    LoggerUtil.d('============> onRefreshHomeData()', tag: 'HomeController');
    getHomeData(
      loadingType: Constant.noLoading,
      refreshState: RefreshState.refresh,
    );
  }

  /// 上滑加载更多
  void onLoadMoreHomeData() {
    LoggerUtil.d('============> onLoadMoreHomeData()', tag: 'HomeController');
    getHomeData(
      loadingType: Constant.noLoading,
      refreshState: RefreshState.loadMore,
    );
  }

  /// 获取首页数据
  Future<void> getHomeData({
    required String loadingType,
    required RefreshState refreshState,
  }) async {
    if (refreshState == RefreshState.refresh ||
        refreshState == RefreshState.first) {
      /// 下拉刷新
      currentPage = 0;
      // 获取首页Banner数据源
      getHomeBannerResponse();
    }
    if (refreshState == RefreshState.loadMore) {
      /// 上滑加载更多
      currentPage++;
      // Fluttertoast.showToast(msg: 'currentPage: $currentPage');
    }
    LoggerUtil.d('============> getHomeData() $currentPage',
        tag: 'HomeController');
    // 获取首页文章列表
    getHomeArticleList(loadingType, refreshState);
  }

  ///获取首页Banner
  Future<void> getHomeBannerResponse() async {
    httpManager(
        loadingType: Constant.noLoading,
        future: provider.get(RequestAPI.homeBanner),
        onSuccess: (value) {
          List<Banner> model =
              (value as List<dynamic>).map((e) => Banner.fromJson(e)).toList();
          homeBannerList.assignAll(model);
        },
        onFail: (fail) {
          EasyLoading.showInfo('${fail.errorMsg}');
        },
        onError: (error) {
          EasyLoading.showInfo('${error.errorMsg}');
        });
  }

  ///获取首页文章列表
  Future<void> getHomeArticleList(
      String loadingType, RefreshState refreshState) async {
    String requestUrl = sprintf(RequestAPI.homeArticleList, [currentPage]);
    httpManagerWithRefreshPaging(
      loadingType: loadingType,
      refreshState: refreshState,
      future: provider.get(requestUrl),
      onSuccess: (response) {
        var homeArticleData = HomeArticleData.fromJson(response);
        List<HomeArticle>? dataList = homeArticleData.datas;
        // 加载到底部判断
        var over = homeArticleData.over;
        if (over != null) {
          if (over) {
            loadNoData();
          }
        }
        if (dataList != null && dataList.isNotEmpty) {
          refreshLoadState = LoadState.success;

          /// 循环遍历 装载 可观察变量 isCollect
          for (var element in dataList) {
            var collect = element.collect;
            //element.isCollect = collect;
          }

          if (refreshState == RefreshState.first) {
            homeArticleList.assignAll(dataList);
          } else if (refreshState == RefreshState.refresh) {
            homeArticleList.assignAll(dataList);
          } else if (refreshState == RefreshState.loadMore) {
            homeArticleList.addAll(dataList);
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
