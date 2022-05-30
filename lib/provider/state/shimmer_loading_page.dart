import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:flutter_wanandroid/res/app_theme.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:getwidget/direction/gf_shimmer_direction.dart';
import 'package:shimmer/shimmer.dart';
import '../../res/gaps.dart';
import 'list_skeleton_shimmer_loading.dart';

/// 类名: shimmer_loading_page.dart
/// 创建日期: 11/12/21 on 10:31 AM
/// 描述: pk_skeleton骨架屏

class ShimmerLoadingPage extends StatelessWidget {
  const ShimmerLoadingPage({
    Key? key,
    this.simpleLoading = true,
  }) : super(key: key);

  final bool simpleLoading;

  @override
  Widget build(BuildContext context) {
    Widget widget;

    simpleLoading
        ? widget = simpleShimmerLoading(context)
        : widget = listShimmerLoading(context);

    return SafeArea(child: Scaffold(body: widget));
  }

  Shimmer simpleShimmerLoading(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Opacity(opacity: 0.6, child: GFLoader()),
            Gaps.vGap10,
            Text(
              Keys.loading.tr,
              style: context.headline6Style,
            ),
          ],
        ),
      ),
    );
  }

  // GFShimmer simpleShimmerLoading(BuildContext context) {
  //   return GFShimmer(
  //     child: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const Opacity(opacity: 0.6, child: GFLoader()),
  //           Gaps.vGap10,
  //           Text(
  //             Keys.loading.tr,
  //             style: context.headline6Style,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget listShimmerLoading(BuildContext context) {
  //   return const GFShimmer(
  //     direction: GFShimmerDirection.leftToRight,
  //     showGradient: true,
  //     child: ListSkeletonShimmerLoading(),
  //   );
  // }

  Widget listShimmerLoading(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: const ListSkeletonShimmerLoading(),
    );
  }
}
