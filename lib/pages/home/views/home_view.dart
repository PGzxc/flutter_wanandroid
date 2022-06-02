import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/home/controllers/home_controller.dart';
import 'package:flutter_wanandroid/pages/home/widgets/home_banner_widget.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../provider/refresh/refresh_paging_state_page.dart';
import '../../../widgets/search_list_item_widget.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-home-页面
/// 说明：
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshPagingStatePage<HomeController>(
      controller: controller,
      onPressed: () => controller.onFirstInHomeData(),
      onRefresh: () => controller.onRefreshHomeData(),
      onLoadMore: () => controller.onLoadMoreHomeData(),
      refreshController: controller.refreshController,
      header: const ClassicHeader(),
      lottieRocketRefreshHeader: false,
      child: CustomScrollView(
        controller: controller.scrollController,
        slivers: [_homeBanner(), _homeArticleList(controller)],
      ),
    );
  }

  /// 轮播图Banner
  Widget _homeBanner() {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 160,
        child: HomeBannerWidget(),
      ),
    );
  }

  Widget _homeArticleList(HomeController controller) {
    return Obx(() {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return SearchListItemWidget(
              dataList: controller.homeArticleList,
              index: index,
              onCollectClick: (int index) {
                // 文章列表收藏、取消收藏
              },
            );
          },
          childCount: controller.homeArticleList.length,
        ),
      );
    });
  }
}
