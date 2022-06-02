import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/models/collect_site_list_response.dart';
import 'package:flutter_wanandroid/provider/request_api.dart';
import 'package:flutter_wanandroid/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../../provider/base_refresh_controller.dart';
import '../../../provider/state/load_state.dart';
import '../../../res/constant.dart';

/// 类名: collect_link_list_controller.dart
/// 描述: 我的收藏页 - 网址收藏列表

class CollectLinkListController extends BaseRefreshController {
  /// 收藏动画显示与否
  final _collectAnimation = false.obs;

  get collectAnimation => _collectAnimation.value;

  set collectAnimation(value) => _collectAnimation.value = value;

  /// 取消收藏动画显示与否
  final _unCollectAnimation = false.obs;

  get unCollectAnimation => _unCollectAnimation.value;

  set unCollectAnimation(value) => _unCollectAnimation.value = value;

  // 返回数据列表
  final collectLinkList = RxList<CollectSite>();

  @override
  void onInit() {
    super.onInit();
    loadState = LoadState.lottieRocketLoading;
    onFirstInRequestData();
  }

  /// 第一次进入
  void onFirstInRequestData() {
    initCollectLinkListData(
      loadingType: Constant.showLoadingDialog,
      refreshState: RefreshState.first,
    );
  }

  /// 下拉刷新首页
  void onRefreshRequestData() {
    initCollectLinkListData(
      loadingType: Constant.showLoadingDialog,
      refreshState: RefreshState.refresh,
    );
  }

  /// 请求数据
  Future<void> initCollectLinkListData({
    required String loadingType,
    required RefreshState refreshState,
  }) async {
    if (refreshState == RefreshState.refresh ||
        refreshState == RefreshState.first) {
      /// 下拉刷新  项目列表数据 页码：拼接在链接中，从0开始
      currentPage = 0;
    }
    if (refreshState == RefreshState.loadMore) {
      /// 上滑加载更多
      currentPage++;
    }

    httpManagerWithRefreshPaging(
      loadingType: loadingType,
      refreshState: refreshState,
      future: provider.get(RequestAPI.collectSiteList),
      onSuccess: (response) {
        /// 类表转换的时候一定要加一下墙砖List<dynamic>，否则会报错
        List<CollectSite> dataList = (response as List<dynamic>)
            .map((e) => CollectSite.fromJson(e))
            .toList();

        if (dataList.isNotEmpty) {
          for (var element in dataList) {
            element.collect = true;
            element.isCollect = true;
          }
          if (refreshState == RefreshState.first) {
            collectLinkList.assignAll(dataList);
          } else if (refreshState == RefreshState.refresh) {
            collectLinkList.assignAll(dataList);
          }
        } else {
          if (loadingType != Constant.noLoading) {
            refreshLoadState = LoadState.empty;
          }
        }

        print('==========>1  ${collectLinkList[0].toJson()}');
        print('==========>2  ${collectLinkList[1].toJson()}');
        print('==========>3  ${collectLinkList[2].toJson()}');
      },
      onFail: (value) {
        EasyLoading.showToast("请求异常:${value.errorMsg}");
      },
      onError: (error) {
        EasyLoading.showToast("请求异常:${error.errorMsg}");
      },
    );
  }

  /// 删除收藏网站  unCollectLink
  void requestUnCollectLink({
    required CollectSite model,
    Function()? onStart,
    Function(CollectSite model)? onSuccess,
    Function(CollectSite model)? onFail,
  }) async {
    // 删除收藏网址
    var unCollectLinkUrl = RequestAPI.unCollectArticle;

    var postUnCollectLinkUrlParams = {
      "id": model.id,
    };

    /// FormData参数
    if (!isLogin) {
      Get.toNamed(Routes.loginRegister);
      return;
    }

    httpManager(
      loadingType: Constant.noLoading,
      // 此接口使用sprintf插件进行String格式化操作  static const String collectInsideArticle = '/lg/collect/%s/json';
      // future: DioUtil().request(requestURL, method: DioMethod.post),
      future: provider.post(unCollectLinkUrl, {},
          query: postUnCollectLinkUrlParams),
      onStart: () {
        // 显示收藏动画
        collectAnimation = true;
      },
      onSuccess: (response) async {
        await Future.delayed(const Duration(milliseconds: 1000));
        // 收藏请求成功 隐藏收藏动画
        collectAnimation = false;
        model.collect = false;
        model.isCollect = false;
        collectLinkList.remove(model);
        EasyLoading.showToast('删除收藏网址成功');
      },
      onFail: (value) async {
        // 收藏请求失败 隐藏收藏动画
        collectAnimation = false;
        model.collect = true;
        model.isCollect = true;
        EasyLoading.showToast('删除收藏网址失败');
      },
      onError: (value) {
        collectAnimation = false;
        model.collect = true;
        model.isCollect = true;
        EasyLoading.showToast('删除收藏网址请求异常');
      },
    );
  }
}
