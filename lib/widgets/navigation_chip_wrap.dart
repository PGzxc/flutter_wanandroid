import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import '../models/home_article_response.dart';

/// 类名: tree_chip_wrap.dart
/// 描述: 导航Chip Wrap 流式列表

class NavigationChipWrap extends StatelessWidget {
  const NavigationChipWrap({
    Key? key,
    required this.chipList,
    required this.onTap,
  }) : super(key: key);

  //流布局数据列表
  final List<Article?>? chipList;
  final Function(Article value) onTap;

  @override
  Widget build(BuildContext context) {
    if (chipList != null) {
      List<Widget> wrapList = chipList!
          .map((e) => _chipWidget(context, e!, chipList!.indexOf(e)))
          .toList();
      return Wrap(
        children: wrapList,
      );
    } else {
      return const SizedBox(height: 20);
      //return Gaps.empty;
    }
  }

  Widget _chipWidget(BuildContext context, Article model, int index) {
    ///使用google GFButton显示每个Item
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GFButton(
            type: GFButtonType.solid,
            onPressed: () => onTap(model),
            color: GFColors.FOCUS,
            child: Text(model.title ?? "")));
  }
}
