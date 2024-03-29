import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:flutter_wanandroid/pages/home/views/home_view.dart';
import 'package:flutter_wanandroid/pages/me/views/me_view.dart';
import 'package:flutter_wanandroid/pages/message/views/message_view.dart';
import 'package:flutter_wanandroid/pages/navigation/views/navigation_view.dart';
import 'package:flutter_wanandroid/pages/project/views/project_view.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:flutter_wanandroid/widgets/keep_alive_wrapper.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/badge/gf_badge.dart';
import 'package:getwidget/components/badge/gf_icon_badge.dart';
import '../../../utils/logger/logger_util.dart';
import '../../login_register/utils/login_register_utils.dart';
import '../../me/controllers/me_controller.dart';

/// 日期：2022-05-16
/// 描述：主页-主屏页面-Bod控制器
/// 说明：包含：MainScreen(主屏页面)+MenuScreen(抽屉页面)

class MainController extends BaseController {
  /// 响应式成员变量，默认位置指引0
  final _currentPage = 0.obs;
  set currentPage(index) => _currentPage.value = index;
  get currentPage => _currentPage.value;

  final _currentTitle = Keys.home.tr.obs;
  set currentTitle(index) => _currentTitle.value = bottomTabs[index].label!;
  get currentTitle => _currentTitle.value;

  // ///未读消息的数量
  // final _messageNum=0.obs;
  // set messageNum(value)=>_messageNum.value=value;
  // get messageNum=>_messageNum.value;

  /// PageView页面控制器
  late PageController pageController;

  /// 底部BottomNavigationBarItem
  late List<BottomNavigationBarItem> bottomTabs;

  late List<Widget> tabPageBodies;

  final mineController = Get.find<MeController>();

  /// 底部Tab点击切换PageView
  void switchBottomTabBar(int index) {
    //点击底部BottomNavigationBarItem切换PageView页面
    pageController.jumpToPage(index);
  }

  /// PageView切换更新当前index
  void onPageChanged(int index) {
    currentPage = index;
    currentTitle = index;
  }

  /// 生命周期
  /// 在Widget内存中分配后立即调用
  /// 可以用它来微控制器初始化initialize一些东西
  @override
  void onInit() {
    super.onInit();

    LoggerUtil.d('onInit()', tag: 'IndexController');
    pageController = PageController(initialPage: currentPage);

    /// 初始静态数据
    bottomTabs = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.home_outlined,
          size: 20,
        ),
        activeIcon: const Icon(Icons.home, size: 25),
        label: Keys.home.tr,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.outlined_flag_outlined, size: 20),
        activeIcon: const Icon(
          Icons.outlined_flag,
          size: 25,
        ),
        label: Keys.navigation.tr,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.dashboard_customize_outlined, size: 20),
        activeIcon: const Icon(Icons.dashboard, size: 25),
        label: Keys.project.tr,
      ),
      BottomNavigationBarItem(
        icon: Obx(() => GFIconBadge(
            counterChild: messageNum>0? GFBadge(color: Colors.red, text: "$messageNum"):const Text(""),
            child: const Icon(Icons.message_outlined, size: 20))),
        activeIcon: Obx(() => GFIconBadge(
            counterChild: messageNum>0? GFBadge(color: Colors.red, text: "$messageNum"):const Text(""),
            child: const Icon(Icons.message, size: 25))),
        label: Keys.message.tr,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person_outline, size: 20),
        activeIcon: const Icon(Icons.person, size: 25),
        label: Keys.me.tr,
      ),
    ];

    // bottomTabs = <BottomNavigationBarItem>[
    //   BottomNavigationBarItem(icon: const Icon(Icons.home_outlined, size: 20,),
    //     activeIcon: const Icon(Icons.home, size: 25),
    //     label: Keys.home.tr,
    //   ),
    //   BottomNavigationBarItem(
    //     icon: const Icon(Icons.account_tree_outlined, size: 20),
    //     activeIcon: const Icon(Icons.account_tree, size: 25,),
    //     label: Keys.tree.tr,
    //   ),
    //   BottomNavigationBarItem(
    //     icon: const Icon(Icons.navigation_outlined, size: 20),
    //     activeIcon: const Icon(Icons.navigation, size: 25),
    //     label: Keys.navigation.tr,
    //   ),
    //   BottomNavigationBarItem(
    //     icon: const Icon(Icons.apps_outlined, size: 20),
    //     activeIcon: const Icon(Icons.apps, size: 25),
    //     label: Keys.project.tr,
    //   ),
    //   BottomNavigationBarItem(
    //     icon: const Icon(Icons.person_outline, size: 20),
    //     activeIcon: const Icon(Icons.person, size: 25),
    //     label: Keys.me.tr,
    //   ),
    // ];
    tabPageBodies = <Widget>[
      ///没有缓存时使用
      // const HomeView(),
      // const TreeView(),
      // const NavigationView(),
      // const ProjectView(),
      // const MeView(),

      ///使用了可滚动组件的页面缓存之后，使用KeepAliveWrapper包裹组件
      const KeepAliveWrapper(keepAlive: true, child: HomeView()),
      const KeepAliveWrapper(keepAlive: true, child: NavigationView()),
      const KeepAliveWrapper(keepAlive: true, child: ProjectView()),
      const KeepAliveWrapper(keepAlive: true, child: MessageView()),
      const KeepAliveWrapper(keepAlive: true, child: MeView()),
    ];
  }

  ///在 onInit() 之后调用 1 帧。这是进入的理想场所
  ///导航事件，例如 snackbar、对话框或新route，或async 异步请求。
  @override
  void onReady() {
    super.onReady();
    // async 拉取数据
    LoggerUtil.d('onReady()', tag: 'MainController');
    if (isLogin) {
      userInfo = LoginRegisterUtils.getUserInfo();
    }
  }

  ///在 [onDelete] 方法之前调用。 [onClose] 可能用于
  ///处理控制器使用的资源。就像 closing events 一样，
  ///或在控制器销毁之前的流。
  ///或者处置可能造成一些内存泄漏的对象，
  ///像 TextEditingControllers、AnimationControllers。
  ///将一些数据保存在磁盘上也可能很有用。
  @override
  void onClose() {
    super.onClose();
    // 1 stop & close 关闭对象
    // 2 save 持久化数据
    LoggerUtil.d('onClose()', tag: 'MainController');
  }

  ///dispose 释放内存
  @override
  void dispose() {
    // dispose释放对象
    pageController.dispose();
    super.dispose();
    LoggerUtil.d('dispose()', tag: 'MainController');
  }

  ///退出登陆
  void logout() {
    EasyLoading.show(status: '加载中...');
    provider.logout().then((value) {
      if (value.success) {
        isLogin = false;
        Get.back();
      } else {
        EasyLoading.showError('退出出错:${value.errorMsg}');
      }
      EasyLoading.dismiss();
    });
  }
}
