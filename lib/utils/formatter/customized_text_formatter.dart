import 'package:flutter/services.dart';

/// 类名: customized_text_formatter.dart
/// 描述: 自定义兼容中文拼音输入法正则校验输入框

class CustomizedTextInputFormatter extends TextInputFormatter {
  final Pattern filterPattern;

  CustomizedTextInputFormatter({required this.filterPattern});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.isComposingRangeValid) return newValue;
    return FilteringTextInputFormatter.allow(filterPattern)
        .formatEditUpdate(oldValue, newValue);
  }
}
