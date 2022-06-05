import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:flutter_wanandroid/res/app_theme.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:lottie/lottie.dart';
import '../../res/app_color.dart';
import '../../res/gaps.dart';
import '../../res/r.dart';
import 'load_state.dart';

/// 类名: load_error_page.dart
/// 描述: 加载错误页面


class EmptyErrorStatePage extends StatelessWidget {
  const EmptyErrorStatePage({
    Key? key,
    required this.loadState,
    required this.onTap,
    required this.errMsg,
    this.showErrMsg = true,
  }) : super(key: key);

  /// 页面类型
  final LoadState loadState;
  final VoidCallback onTap;
  final String? errMsg;
  final bool? showErrMsg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Gaps.vGap150,
                Container(
                  child: Lottie.asset(
                    loadState == LoadState.empty
                        ? R.assetsLottieRefreshEmpty
                        : R.assetsLottieRefreshError,
                    width: 200,
                    fit: BoxFit.cover,
                    animate: true,
                  ),
                ),
                loadState == LoadState.empty ? Gaps.empty : Gaps.vGap26,
                Visibility(
                  visible: showErrMsg??false,
                  child: Text(
                    '$errMsg，${Keys.clickRetry.tr}',
                    style: context.bodyText2Style!.copyWith(
                      color: AppColors.colorB8C0D4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
