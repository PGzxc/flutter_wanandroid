import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:flutter_wanandroid/provider/request_api.dart';
import 'package:flutter_wanandroid/res/constant.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../models/navigation_response.dart';

///日期：2022-06-03
///描述：导航-体系-常用网站

class NavigationSiteController extends BaseController {
  ///左侧导航条
  final navigationGroupList = RxList<NavigatorData>();

  ///右侧展示选中导航条内容区域
  final currentNavigation = NavigatorData().obs;

  @override
  void onReady() {
    super.onReady();
    getNavigationData();
  }

  Future<void> getNavigationData() async {
    httpManager(
        loadingType: Constant.showLoadingDialog,
        future: provider.get(RequestAPI.navigationList),
        onSuccess: (value) {
          List<NavigatorData> navigationData = (value as List<dynamic>)
              .map((e) => NavigatorData.fromJson(e))
              .toList();
          navigationGroupList.assignAll(navigationData);
          currentNavigation.value = navigationGroupList[0];
        },
        onFail: (fail) {},
        onError: (error) {});
  }

  /// 点击切换导航
  void changeNavigation(NavigatorData model) {
    currentNavigation.value = model;
  }
}
