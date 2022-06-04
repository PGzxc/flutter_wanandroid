import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/navigation/views/navigation_site_view.dart';
import 'package:flutter_wanandroid/pages/navigation/views/navigation_tree_view.dart';
import 'package:flutter_wanandroid/pages/navigation/views/navigation_wx_view.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import '../../../widgets/keep_alive_wrapper.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-navigation-控制器
/// 说明：

class NavigationController extends BaseController {
  late TabController tabController;
  late List<Widget> tabPageBodies;

  final tabValues = ['体系', '常用网站', '公众号'];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabValues.length, initialIndex: 0, vsync: this);
    tabPageBodies = <Widget>[
      const KeepAliveWrapper(
        keepAlive: true,
        child: NavigationTreeView(),
      ),
      const KeepAliveWrapper(
        keepAlive: true,
        child: NavigationSiteView(),
      ),
      const KeepAliveWrapper(
        child: NavigationWxView(),
      ),
    ];
  }
}
