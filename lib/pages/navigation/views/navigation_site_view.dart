import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:flutter_wanandroid/models/navigation_response.dart';
import 'package:flutter_wanandroid/pages/navigation/controllers/navigation_site_controller.dart';
import 'package:flutter_wanandroid/res/app_theme.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/typography/gf_typography.dart';
import 'package:getwidget/types/gf_typography_type.dart';
import '../../../provider/refresh/common_state_page.dart';
import '../../../provider/state/load_error_page.dart';
import '../../../provider/state/load_state.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/navigation_chip_wrap.dart';

///导航-常用网站

class NavigationSiteView extends GetView<NavigationSiteController> {
  const NavigationSiteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonStatePage<NavigationSiteController>(
      controller: controller,
      onPressed: () => controller.getNavigationData(),
      child: wanNavigationView(controller),
    );
  }

  Widget wanNavigationView(NavigationSiteController controller) {
    return Row(
      children: [
        SizedBox(width: 100, child: leftNavigationGroupView(controller)),
        Expanded(child: rightNavigationChildrenView(controller)),
      ],
    );
  }

  Widget leftNavigationGroupView(NavigationSiteController controller) {
    return Obx(() {
      var navigationGroupList = controller.navigationGroupList;
      var currentNavigation = controller.currentNavigation.value;

      var divider = const Divider(height: 0);

      return ListView.separated(
        separatorBuilder: (context, index) => divider,
        itemCount: controller.navigationGroupList.length,
        itemBuilder: (context, index) {
          // 当前是否选中
          bool isSelectNavigation =
              navigationGroupList[index].cid == currentNavigation.cid;

          /// 给InkWell内部的组件设置颜色，会导致给InkWell的点击水波纹效果消失，需要在外面套一层Ink或者MMaterial组件
          return Ink(
            color: isSelectNavigation
                ? context.backgroundColor
                : Colors.grey.withOpacity(0.1),
            child: InkWell(
              /// 点击导航item切换当前导航item值currentNavigation
              onTap: () =>
                  controller.changeNavigation(navigationGroupList[index]),
              child: Container(
                height: 40,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 当前导航选中时显示
                    Visibility(
                      visible: isSelectNavigation,
                      child: Container(
                        width: 2,
                        height: 45,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          navigationGroupList[index].name ?? "",
                          style: TextStyle(
                            color: isSelectNavigation
                                ? context.bodyText1Color
                                : context.bodyText2Color,
                            fontSize: isSelectNavigation ? 14 : 12,
                            fontWeight: isSelectNavigation
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget rightNavigationChildrenView(NavigationSiteController controller) {
    return Obx(() {
      var currentNavigation = controller.currentNavigation.value;
      if (currentNavigation == null) {
        return EmptyErrorStatePage(
          loadState: LoadState.empty,
          onTap: () => controller.getNavigationData(),
          errMsg: Keys.noData.tr,
        );
      }

      return Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GFTypography(
              text: currentNavigation.name??'',
              type: GFTypographyType.typo2,
              //showDivider: false,
              //dividerColor: const Color(0xFF19CA4B),
            ),
            // 不滚动标题栏，只滚动标签流动布局
            /// Column直接套子组件会超出
            Expanded(
              child: (currentNavigation.articles != null &&
                      currentNavigation.articles!.isNotEmpty)
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        left: 3,
                        right: 1,
                        top: 3,
                        bottom: 3,
                      ),
                      child: articlesWrap(currentNavigation),
                    )
                  : EmptyErrorStatePage(
                      loadState: LoadState.empty,
                      onTap: () => controller.getNavigationData(),
                      errMsg: Keys.noData.tr,
                    ),
            ),
          ],
        ),
      );
    });
  }

  /// 流布局列表
  Widget articlesWrap(NavigatorData model) {
    return NavigationChipWrap(
        chipList: model.articles,
        onTap: (value) {
          Get.toNamed(
            Routes.articleDetail.nameToRoute(),
            arguments: {
              "data": value,
              "showCollect": true,
            },
          );
        });
  }
}
