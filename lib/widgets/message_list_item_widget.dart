import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_wanandroid/models/message_read_list_response.dart';
import 'package:flutter_wanandroid/pages/message/views/message_detail_web_page.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:flutter_wanandroid/res/app_theme.dart';
import 'package:flutter_wanandroid/routes/app_routes.dart';
import 'package:flutter_wanandroid/widgets/ripple_view.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/card/gf_card.dart';
import '../i18n/i18n_keys.dart';
import '../models/home_article_response.dart';
import '../res/constant.dart';
import '../res/gaps.dart';
import '../utils/decoration_style.dart';
import '../utils/html_utils.dart';
import 'cached_network_image_view.dart';

/// 类名: message_list_item_widget.dart
/// 描述: 消息列表Item

class MessageListItemWidget extends GetView<BaseController> {
  const MessageListItemWidget({
    Key? key,
    required this.dataList,
    required this.index,
    required this.onCollectClick,
  }) : super(key: key);

  /// 文章类表数据源
  final List<Message> dataList;

  /// ListView item index
  final int index;

  /// 红心收藏点击事件
  final Function(int index) onCollectClick;

  @override
  Widget build(BuildContext context) {
    return RippleView(
        onTap: () => Get.toNamed(
              Routes.messageWebView.nameToRoute(),
              ///此处要修改
              arguments: {
                "data": dataList[index],
                "index": index,
                "showCollect": true,
              },
            ),
        child: GFCard(
          color: context.colorItemBackground,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(5),
          boxFit: BoxFit.cover,
          content: Column(
            children: [
              chapterCollect(context),
              Gaps.vGap10,
              //chapterTag(context),
              //Gaps.vGap10,
              authorShareTime(context)
              //leftContainer(context)
            ],
          ),
        ));
  }

  Widget leftContainer(BuildContext context) {
    return SizedBox(width: Get.width,child: Text(dataList[index].message));
  }

  // /// 作者、时间
  Widget authorShareTime(BuildContext context) {
    return Column(
      children: [chapterTag(context), Gaps.vGap10, leftContainer(context)],
    );
  }

  /// tags
  Widget chapterTag(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(right: 0),
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
        vertical: 2,
      ),
      decoration: DecorationStyle.imageDecorationCircle(
        color: Colors.blueAccent,
        borderRadius: 3,
      ),
      child: Text(
        dataList[index].title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }

  /// 时间、分享时间
  Widget niceDate(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.access_time, size: 15),
        Gaps.hGap5,
        Text(
          dataList[index].niceDate,
          style: context.bodyText2Style?.copyWith(fontSize: 12),
        ),
      ],
    );
  }

  /// 分类、是否收藏
  Widget chapterCollect(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          decoration: DecorationStyle.imageDecorationCircle(
            color: Colors.lightBlue,
            borderRadius: 3,
          ),
          child: Row(
            children: [
              const Icon(Icons.person_outline, size: 15),
              Text(
                dataList[index].fromUser,
                style: context.bodyText2Style?.copyWith(fontSize: 12),
              )
            ],
          ),
        ),
        Gaps.hGap10,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
          decoration: DecorationStyle.imageDecorationCircle(
            color: Colors.red,
            borderRadius: 3,
          ),
          child: Text(
            dataList[index].tag,
            style: context.bodyText2Style?.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(),
        niceDate(context),
      ],
    );
  }
}
