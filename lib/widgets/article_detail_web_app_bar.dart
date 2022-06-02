import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_wanandroid/i18n/i18n_keys.dart';
import 'package:flutter_wanandroid/models/home_article_response.dart';
import 'package:flutter_wanandroid/res/app_theme.dart';
import 'package:flutter_wanandroid/widgets/popup_window_widget.dart';
import 'package:flutter_wanandroid/widgets/ripple_view.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import '../pages/article_webpage/controllers/article_detail_controller.dart';
import '../res/r.dart';
import 'article_detail_app_bar_add_menu.dart';

/// 类名: article_detail_web_app_bar.dart
/// 创建日期: 12/2/21 on 3:47 PM
/// 描述: 文章详情WebView页面 通用标题栏
/// 左右边距12

class ArticleDetailWebAppBar extends GetView<ArticleDetailController>
    implements PreferredSizeWidget {
  ArticleDetailWebAppBar({
    Key? key,
    required this.model,
    required this.showCollect,
    this.opacity = 1.0,
    this.appBarHeight = 56.0,
    this.backgroundColor,
    this.showBottomLine = false,
    this.bottomLineHeight = 0.6,
    this.bottomLineColor,
  }) : super(key: key);

  final HomeArticle model;
  final bool showCollect;
  final double opacity;
  final double appBarHeight;
  final Color? backgroundColor;

  /// 是否显示下划线
  final bool showBottomLine;
  final double bottomLineHeight;
  final Color? bottomLineColor;

  // GlobalKey能够跨Widget访问状态
  // 定义了一个GlobalKey并传递给Widget1，然后我们便可以通过这个key拿到它所绑定的SwitcherWidgetState并在外部调用SwitcherWidgetState的changeState方法改变状态了
  final GlobalKey _addKey = GlobalKey();

  final detailController = Get.find<ArticleDetailController>();

  @override
  Widget build(BuildContext context) {
    final Color? _backgroundColor =
        backgroundColor ?? Get.context?.backgroundColor;

    final SystemUiOverlayStyle _overlayStyle =
        ThemeData.estimateBrightnessForColor(_backgroundColor ?? Colors.blue) ==
                Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;

    return Opacity(
      opacity: opacity,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _overlayStyle,
        child: Material(
          color: _backgroundColor,
          child: SafeArea(
            child: Container(
              height: appBarHeight,
              decoration: BoxDecoration(
                /// 使用装饰器设置是否显示下划线
                border: Border(
                  bottom: showBottomLine
                      ? Divider.createBorderSide(context,
                          width: bottomLineHeight, color: bottomLineColor)
                      : Divider.createBorderSide(context,
                          width: 0.0, color: Colors.transparent),
                ),
              ),
              child: Row(
                children: [
                  backWidget(context),
                  titleWidget(context),
                  const Spacer(),
                  rightWidget(context, model),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  Widget backWidget(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 2),
          child: RippleView(
            color: Colors.transparent,
            radius: 100,
            onTap: () async {
              await detailController.webViewController.canGoBack()
                  ? detailController.webViewController.goBack()
                  : {
                      Get.back(),
                      // 恢复第一次进入标志
                      detailController.isFirstInitWeb = true,
                    };
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        Obx(() {
          return Visibility(
            visible: !detailController.isFirstInitWeb,
            child: RippleView(
              color: Colors.transparent,
              radius: 100,
              onTap: () => {
                Get.back(),
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.close_outlined,
                  color: context.appBarIconColor,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget titleWidget(BuildContext context) {
    String? name;
    if (model.author != null) {
      if (model.author!.isNotEmpty) {
        name = model.author!;
      } else if (model.shareUser != null) {
        if (model.shareUser!.isNotEmpty) {
          name = model.shareUser!;
        }
      }
    }
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15),
            child: Text(
              name ?? Keys.myCompany.tr,
              style: context.bodyText2Style,
            ),
          ),
        ],
      ),
    );
  }

  Widget rightWidget(BuildContext context, HomeArticle model) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
            visible: showCollect,
            child: RippleView(
              radius: 100,
              color: Colors.transparent,
              onTap: () => detailController.requestCollectArticle(model),
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Obx(() {
                  return (controller.isLogin && model.collect!)
                      ? const Icon(
                          Icons.favorite,
                          color: GFColors.DANGER,
                        )
                      : const Icon(Icons.favorite_border);
                }),
              ),
            ),
          ),
          RippleView(
            key: _addKey,
            color: Colors.transparent,
            radius: 100,
            onTap: () => showAddMenu(context, model),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                R.assetsSvgShare,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showAddMenu(BuildContext context, HomeArticle model) {
    final RenderBox button =
        _addKey.currentContext!.findRenderObject()! as RenderBox;
    showPopupWindow<void>(
      context: context,
      isShowBg: false,
      offset: Offset(button.size.width - 8.0, 0),
      anchor: button,
      child: ArticleDetailAppBarAddMenu(model: model),
    );
  }
}
