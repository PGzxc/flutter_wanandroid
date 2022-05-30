import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:get/get.dart';
import '../../res/gaps.dart';
import '../state/load_error_page.dart';
import '../state/load_state.dart';
import '../state/loading_lottie_rocket_widget.dart';
import '../state/shimmer_loading_page.dart';

/// 类名: common_state_page.dart
/// 创建日期: 11/16/21 on 3:58 PM
/// 描述: Common State Widget 封装
/// 作者: 杨亮

class CommonStatePage<T extends BaseController> extends StatefulWidget {
  const CommonStatePage({
    Key? key,
    required this.controller,
    required this.onPressed,
    this.errorPage,
    this.emptyPage,
    required this.child,
  }) : super(key: key);

  // 业务GetXController
  final T controller;

  // 点击事件
  final VoidCallback onPressed;

  // 自定义设置错误页面
  final Widget? errorPage;

  // 自定义设置空页面
  final Widget? emptyPage;

  //组件
  final Widget child;

  @override
  _CommonStatePageState<T> createState() {
    return _CommonStatePageState<T>();
  }
}

class _CommonStatePageState<T extends BaseController> extends State<CommonStatePage<T>> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (widget.controller.loadState == LoadState.simpleShimmerLoading) {
          return const ShimmerLoadingPage();
        } else if (widget.controller.loadState ==
            LoadState.multipleShimmerLoading) {
          return const ShimmerLoadingPage(
            simpleLoading: false,
          );
        } else if (widget.controller.loadState ==
            LoadState.lottieRocketLoading) {
          return Column(
            children: const [
              Gaps.vGap150,
              LoadingLottieRocketWidget(
                visible: true,
                animate: true,
                repeat: true,
              ),
            ],
          );
        } else if (widget.controller.loadState == LoadState.fail) {
          return widget.errorPage ??
              EmptyErrorStatePage(
                loadState: LoadState.fail,
                onTap: widget.onPressed,
                errMsg: widget.controller.httpErrorMsg,
              );
        } else if (widget.controller.loadState == LoadState.empty) {
          return widget.emptyPage ??
              EmptyErrorStatePage(
                loadState: LoadState.empty,
                onTap: widget.onPressed,
                errMsg: Keys.noData.tr,
              );
        } else if (widget.controller.loadState == LoadState.success) {
          return widget.child;
        }
        return Gaps.empty;
      }),
    );
  }
}
