import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/models/home_article_response.dart';
import 'package:flutter_wanandroid/res/app_theme.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';

import '../pages/article_webpage/controllers/article_detail_controller.dart';
import '../res/app_color.dart';
import '../res/r.dart';

class ArticleDetailAppBarAddMenu extends StatefulWidget {
  const ArticleDetailAppBarAddMenu({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Article model;

  @override
  _ArticleDetailAppBarAddMenuState createState() =>
      _ArticleDetailAppBarAddMenuState();
}

class _ArticleDetailAppBarAddMenuState extends State<ArticleDetailAppBarAddMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final detailController = Get.find<ArticleDetailController>();

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = context.backgroundColor;
    final Color? iconColor = context.appIconColor;

    final Widget body = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(right: 12),
          child: Image.asset(
            R.iconInvertedTriangle,
            width: 8,
            height: 4,
            color: backgroundColor,
          ),
        ),
        SizedBox(
          width: 120.0,
          height: 40.0,
          child: TextButton.icon(
            onPressed: () {
              // 刷新页面
              detailController.reloadWebView();
              Get.back();
            },
            icon: const Icon(Icons.refresh),
            label: const Text('刷新页面'),
            style: TextButton.styleFrom(
              primary: Theme.of(context).textTheme.bodyText2?.color,
              onSurface: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.color
                  ?.withOpacity(0.12),
              backgroundColor: backgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
        Container(width: 120.0, height: 0.6, color: AppColors.colorB8C0D4),
        SizedBox(
          width: 120.0,
          height: 40.0,
          child: TextButton.icon(
            onPressed: () {
              // 收藏、取消收藏站内文章
              detailController.requestCollectArticle(widget.model);
              Get.back();
            },
            icon: (widget.model.collect!)
                ? const Icon(
                    Icons.favorite,
                    color: GFColors.DANGER,
                  )
                : const Icon(Icons.favorite_border),
            label: const Text('收藏文章'),
            style: TextButton.styleFrom(
              primary: Theme.of(context).textTheme.bodyText2?.color,
              onSurface: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.color
                  ?.withOpacity(0.12),
              backgroundColor: backgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 120.0,
          height: 40.0,
          child: TextButton.icon(
            onPressed: () {
              // 收藏、取消收藏网址
              detailController.requestCollectLink();
              Get.back();
            },
            icon: const Icon(Icons.collections),
            label: const Text('收藏网址'),
            style: TextButton.styleFrom(
              primary: Theme.of(context).textTheme.bodyText2?.color,
              onSurface: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.color
                  ?.withOpacity(0.12),
              backgroundColor: backgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (_, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          alignment: Alignment.topRight,
          child: child,
        );
      },
      child: body,
    );
  }
}
