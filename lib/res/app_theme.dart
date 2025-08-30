import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_color.dart';

///白天模式
ThemeData lightTheme = ThemeData.light().copyWith(
  useMaterial3: true,
  primaryColor: Colors.blue,
  splashColor: Colors.white12,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    elevation: 0,
    backgroundColor: ThemeData.light().scaffoldBackgroundColor,
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  scaffoldBackgroundColor: ThemeData.light().scaffoldBackgroundColor,
  //backgroundColor: Colors.white,
  iconTheme: const IconThemeData(
    color: AppColors.iconLightColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.iconLightColor,
  ),
  // textTheme: const TextTheme(
  //   headline1: TextStyle(
  //     color: Colors.black,
  //   ),
  //   headline3: TextStyle(
  //     color: Colors.black,
  //   ),
  //   subtitle1: TextStyle(
  //     color: Colors.black,
  //   ),
  //   bodyText1: TextStyle(
  //     color: Colors.black,
  //   ),
  //   bodyText2: TextStyle(
  //     color: Colors.black54,
  //   ),
  // ),
);

///夜间模式
ThemeData darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  primaryColor: Colors.black12,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 0,
    backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
  //backgroundColor: Colors.black12,
  iconTheme: const IconThemeData(
    color: AppColors.iconDarkColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: AppColors.iconDarkColor,
  ),
);

class ThemeKey {
  static const String appThemeKey = "app_theme_data";
  static const String darkTheme = "夜间模式";
  static const String lightTheme = "日间模式";
  static const String systemTheme = "跟随系统";
}

/// 主题列表
Map<String, ThemeData>? themeDataList = {
  ThemeKey.darkTheme: darkTheme,
  ThemeKey.lightTheme: lightTheme,
};

bool isDarkMode(BuildContext context) {
  return Theme.of(context).colorScheme.brightness == Brightness.dark;
}

extension ThemeExtension on BuildContext {
  Color? get statusBarColor =>
      Theme.of(this).appBarTheme.systemOverlayStyle!.statusBarColor;

  //WrapChip背景填充色
  Color? get colorItemBackground {
    return Get.isDarkMode ? Colors.black12.withOpacity(0.3) : Colors.white.withOpacity(0.8);
  }

  //WrapChip背景填充色
  Color? get chipBackgroundColor {
    return Get.isDarkMode ? Colors.grey.withOpacity(0.2) : Colors.grey[200];
  }

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get backgroundColor => Theme.of(this).colorScheme.surface;

  Color? get appBarBackgroundColor =>
      Theme.of(this).appBarTheme.backgroundColor;

  Color? get appIconColor => Theme.of(this).iconTheme.color;

  Color? get appBarIconColor => Theme.of(this).appBarTheme.iconTheme?.color;

  Color get dialogBackgroundColor => Theme.of(this).canvasColor;

  Color? get headline1Color => Theme.of(this).textTheme.displayLarge?.color;

  Color? get subtitle1Color => Theme.of(this).textTheme.titleMedium?.color;

  Color? get subtitle2Color => Theme.of(this).textTheme.titleSmall?.color;

  Color? get bodyText1Color => Theme.of(this).textTheme.bodyLarge?.color;

  Color? get bodyText2Color => Theme.of(this).textTheme.bodyMedium?.color;

  Color? get iconDataColor => Theme.of(this).iconTheme.color;

  Color? get bottomNavigationBarBackgroundColor =>
      Theme.of(this).bottomNavigationBarTheme.backgroundColor;

  Color? get bottomNavigationBarSelectedItemColor =>
      Theme.of(this).bottomNavigationBarTheme.selectedItemColor;

  Color? get bottomNavigationBarUnSelectedItemColor =>
      Theme.of(this).bottomNavigationBarTheme.unselectedItemColor;

  Color? get splashColor => Theme.of(this).splashColor;

  Color? get highlightColor => Theme.of(this).highlightColor;
}

extension StyleExtension on BuildContext {
  TextStyle? get headline1Style => Theme.of(this).textTheme.displayLarge;

  TextStyle? get headline2Style => Theme.of(this).textTheme.displayMedium;

  TextStyle? get headline3Style => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headline4Style => Theme.of(this).textTheme.headlineMedium;

  TextStyle? get headline5Style => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get headline6Style => Theme.of(this).textTheme.titleLarge;

  TextStyle? get subtitle1Style => Theme.of(this).textTheme.titleMedium;

  TextStyle? get subtitle2Style => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyText1Style => Theme.of(this).textTheme.bodyLarge;

  TextStyle? get bodyText2Style => Theme.of(this).textTheme.bodyMedium;
}
