import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:flutter_wanandroid/pages/setting/controllers/setting_controller.dart';
import 'package:flutter_wanandroid/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_list_title.dart';

/// 日期：2022-05-17
/// 描述：主页-主屏页面-Body-me-设置-页面
/// 说明：

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: ListView(
          children: [
            CustomListTitle(
              // title: '主题',
              title: Keys.theme.tr,
              isShowLeftWidget: true,
              leftWidget: context.isDarkMode
                  ? const Icon(Icons.nightlight_round)
                  : const Icon(Icons.wb_sunny_rounded),
              rightContent: Keys.theme.tr,
              rightImage: 'images/ic_arrow_right.png',
              onTap: () => Get.toNamed(Routes.theme.nameToRoute()),
            ),
            CustomListTitle(
              // title: '语言',
              title: Keys.language.tr,
              isShowLeftWidget: true,
              leftWidget: const Icon(Icons.language),
              rightContent: Keys.language.tr,
              onTap: () => Get.toNamed(Routes.language.nameToRoute()),
            ),
            Visibility(
              visible: true,
              child: CustomListTitle(
                title: Keys.logout.tr,
                isShowLeftWidget: true,
                leftWidget: const Icon(Icons.logout),
                onTap: () => {},
              ),
            ),
          ],
        ));
  }
}
