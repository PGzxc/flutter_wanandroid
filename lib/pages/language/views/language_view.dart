import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/language/controllers/language_controller.dart';
import 'package:flutter_wanandroid/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_list_title.dart';

/// 日期：2022-05-17
/// 描述：主页-主屏页面-Body-me-设置-页面
/// 说明：

class LanguageView extends GetView<LanguageController> {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Language'),),
        body: _buildLanguageListView());
  }

  Widget _buildLanguageListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: controller.languageList.length,
      itemBuilder: (context, index) {
        return CustomListTitle(
          title: controller.languageList[index].name!.tr,
          isSelectType: true,
          isSelect: controller.languageList[index].isSelect,
          rightWidget: const Icon(Icons.radio_button_checked, size: 20,),
          onTap: () => {
            controller.onSelectLanguage(index),
            Get.offAllNamed(Routes.main),
          },
        );
      },
    );
  }
}
