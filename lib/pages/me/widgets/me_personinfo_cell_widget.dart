import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/me/controllers/me_controller.dart';
import 'package:flutter_wanandroid/res/app_theme.dart';
import 'package:get/get.dart';
import '../../../res/gaps.dart';
import '../../login_register/utils/login_register_utils.dart';

class MePersonInfoCellWidget extends GetView<MeController> {
  const MePersonInfoCellWidget({
    required this.title,
    this.titleTextStyle,
    this.value,
    this.valueTextStyle,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final TextStyle? titleTextStyle;
  final String? value;
  final TextStyle? valueTextStyle;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: titleTextStyle ??
                context.bodyText2Style?.copyWith(fontSize: 12),
          ),
          Gaps.vGap5,
          Text(LoginRegisterUtils().isLogin ? '$value' : '-',style: context.headline6Style,)
        ],
      ),
    );
  }
}
