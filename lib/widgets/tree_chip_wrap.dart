import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import '../models/tree_response.dart';

/// 类名: tree_chip_wrap.dart
/// 描述: 体系 Chip Wrap 流式列表

class TreeChipWrap extends StatelessWidget {
  const TreeChipWrap({
    Key? key,
    required this.chipList,
    required this.onTap,
  }) : super(key: key);

  //流布局数据列表
  final List<Children?> chipList;
  final Function(Children value, int index) onTap;

  @override
  Widget build(BuildContext context) {
    if (chipList.isNotEmpty) {
      List<Widget> wrapList = chipList
          .map((e) => _chipWidget(context, e!, chipList.indexOf(e)))
          .toList();
      return Wrap(
        children: wrapList,
      );
    } else {
      //return Gaps.empty;
      return const SizedBox(height: 20);
    }
  }

  Widget _chipWidget(BuildContext context, Children model, int index) {
    ///使用google GFButton显示每个Item
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GFButton(
            type: GFButtonType.outline,
            onPressed: () => onTap(model, index),
            color: GFColors.FOCUS,
            child: Text(model.name)));
  }
}
