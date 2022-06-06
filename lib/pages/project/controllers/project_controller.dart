import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/models/project_tree_response.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:flutter_wanandroid/provider/request_api.dart';
import 'package:get/get.dart';
import '../../../provider/state/load_state.dart';
import '../../../res/constant.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-project-页面
/// 说明：

class ProjectController extends BaseController {
  ///Tab控制器
  late TabController tabController;

  ///项目分类
  final projectTreeList = RxList<Project>();

  ///分类项
  late List<Widget> tabPageBodies;

  @override
  void onInit() {
    super.onInit();
    //getProjectTreeList();
    // tabPageBodies = <Widget>[];
  }

  Future<dynamic> getProjectTreeList() async {
    httpManager(
      loadingType: Constant.showLoadingDialog,
      future: provider.get(RequestAPI.projectTreeList),
      onSuccess: (response) {
        ///列表转换的时候一定要加一下强转List<dynamic>，否则会报错
        List<Project> dataList = (response as List<dynamic>)
            .map((e) => Project.fromJson(e))
            .toList();
        projectTreeList.assignAll(dataList);
        if (projectTreeList.isNotEmpty) {
          initTabController();
          loadState = LoadState.success;
        } else {
          loadState = LoadState.empty;
        }
      },
      onFail: (value) {
        loadState = LoadState.fail;
      },
      onError: (error) {
        loadState = LoadState.fail;
      },
    );
  }

  void initTabController() {
    tabController = TabController(
        length: projectTreeList.length, initialIndex: 0, vsync: this);
  }
}
