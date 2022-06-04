import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/navigation/controllers/navigation_wx_controller.dart';
import 'package:flutter_wanandroid/res/app_theme.dart';
import 'package:flutter_wanandroid/widgets/wx_list_item_widget.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../provider/refresh/common_state_page.dart';
import '../../../provider/refresh/refresh_paging_state_page.dart';

class NavigationWxView extends GetView<NavigationWxController> {
  const NavigationWxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CommonStatePage<NavigationWxController>(
          controller: controller,
          onPressed: () => controller.initLeftNavigationData(),
          child: wxNavigationView(controller),
        ));
  }

  Widget wxNavigationView(NavigationWxController controller) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: leftNavigationGroupView(controller),
        ),
        Expanded(
          child: rightNavigationChildrenView(controller),
        ),
      ],
    );
  }

  Widget leftNavigationGroupView(NavigationWxController controller) {
    return Obx(() {
      var navigationGroupList = controller.leftDataList;
      var currentNavigation = controller.currentWXItem.value;

      var divider = const Divider(
        height: 0,
      );

      return ListView.separated(
        separatorBuilder: (context, index) => divider,
        itemCount: controller.leftDataList.length,
        itemBuilder: (context, index) {
          // 当前是否选中
          bool isSelectNavigation = navigationGroupList[index].name == currentNavigation.name;

          /// 给InkWell内部的组件设置颜色，会导致给InkWell的点击水波纹效果消失，需要在外面套一层Ink或者MMaterial组件
          return Ink(
            color: isSelectNavigation ? context.backgroundColor : Colors.grey.withOpacity(0.1),
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
                            fontWeight:
                            isSelectNavigation ? FontWeight.bold : FontWeight.normal,
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

  Widget rightNavigationChildrenView(NavigationWxController controller) {
    return RefreshPagingStatePage<NavigationWxController>(
      controller: controller,
      onPressed: () => controller.onFirstInWXData(),
      onRefresh: () => controller.onRefreshWXData(),
      onLoadMore: () => controller.onLoadMoreWXData(),
      refreshController: controller.refreshController,
      header: const ClassicHeader(),
      lottieRocketRefreshHeader: false,
      child: CustomScrollView(
        // 滑动监听器
        controller: controller.scrollController,
        slivers: [
          _homeArticleList(controller),
        ],
      ),
    );
  }

  Widget _homeArticleList(NavigationWxController controller) {
    return Obx(() {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return WXListItemWidget(
              dataList: controller.rightArticleList.value,
              index: index,
              onCollectClick: (int index) {},
            );
          },
          childCount: controller.rightArticleList.length,
        ),
      );
    });
  }
}
