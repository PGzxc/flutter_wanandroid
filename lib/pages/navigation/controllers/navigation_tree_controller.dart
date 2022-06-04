import 'package:flutter_wanandroid/models/tree_response.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:flutter_wanandroid/provider/base_refresh_controller.dart';
import 'package:flutter_wanandroid/provider/request_api.dart';
import 'package:flutter_wanandroid/res/constant.dart';
import 'package:get/get.dart';
///日期：2022-06-03
///描述：导航-体系-控制器

class NavigationTreeController extends BaseRefreshController {
  ///体系Item
  final treeList = RxList<TreeItem>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initNavigationTreeData();
  }

  Future<void> initNavigationTreeData() async {
    httpManager(
        loadingType: Constant.showLoadingDialog,
        future: provider.get(RequestAPI.treeList),
        onSuccess: (value) {
          List<TreeItem> treeListData = (value as List<dynamic>)
              .map((e) => TreeItem.fromJson(e))
              .toList();
          treeList.assignAll(treeListData);
        },
        onFail: (fail) {},
        onError: (error) {});
  }
}
