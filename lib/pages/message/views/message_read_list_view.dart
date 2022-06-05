import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/pages/message/controllers/message_read_list_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../provider/refresh/refresh_paging_state_page.dart';
import '../../../widgets/message_list_item_widget.dart';

class MessageReadListView extends GetView<MessageReadListController>{
  const MessageReadListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshPagingStatePage<MessageReadListController>(
      controller: controller,
      onPressed: () => controller.onFirstInMessageReadData(),
      onRefresh: () => controller.onRefreshMessageReadData(),
      onLoadMore: () => controller.onLoadMoreMessageReadData(),
      refreshController: controller.refreshController,
      header: const ClassicHeader(),
      lottieRocketRefreshHeader: false,
      child: CustomScrollView(
        controller: controller.scrollController,
        slivers: [_messageReadList(controller)],
      ),
    );
  }
  Widget _messageReadList(MessageReadListController controller) {
    return Obx(() {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return MessageListItemWidget(
              dataList: controller.messageUnReadList,
              index: index,
              onCollectClick: (int index) {},
            );
          },
          childCount: controller.messageUnReadList.length,
        ),
      );
    });
  }

}