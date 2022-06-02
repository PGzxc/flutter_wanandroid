import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/models/home_article_response.dart';
import 'package:flutter_wanandroid/pages/home/controllers/home_controller.dart';
import 'package:flutter_wanandroid/routes/app_routes.dart';
import 'package:flutter_wanandroid/widgets/cached_network_image_view.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

class HomeBannerWidget extends GetView<HomeController> {
  const HomeBannerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => _bannerWidget());
  }

  Widget _bannerWidget() {
    return SizedBox(
      height: 160,
      child: controller.homeBannerList.isEmpty
          ? Container(
              height: 160,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)))
          : GFCarousel(
              height: 160,
              autoPlay: true,
              hasPagination: true,
              viewportFraction: 1.0,
              activeIndicator: GFColors.SUCCESS,
              passiveIndicator: GFColors.DARK,
              aspectRatio: 2,
              items: controller.homeBannerList
                  .where((banner) => banner.isVisible == 1)
                  .map((banner) => InkWell(
                      child: CachedNetworkImageView(visible: true, imageUrl: banner.imagePath),
                      onTap: () {
                        // 构造Bean对象
                        HomeArticle model = HomeArticle();
                        model.id = banner.id;
                        model.title = banner.title;
                        model.type = banner.type;
                        model.envelopePic = banner.imagePath;
                        model.link = banner.url;
                        // 跳转文章详情Web页
                        Get.toNamed(
                          Routes.articleDetail.nameToRoute(),
                          arguments: {
                            "data": model,
                            "index": 1,
                            "showCollect": false,
                          },
                        );
                      }))
                  .toList(),
            ),
    );
  }
}
