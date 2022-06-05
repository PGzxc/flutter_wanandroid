
import 'package:flutter/cupertino.dart';
import 'package:flutter_wanandroid/pages/message/controllers/message_unread_list_controller.dart';
import 'package:flutter_wanandroid/widgets/message_list_item_widget.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../provider/refresh/refresh_paging_state_page.dart';

class MessageUnreadListView extends GetView<MessageUnreadListController>{
  const MessageUnreadListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshPagingStatePage<MessageUnreadListController>(
      controller: controller,
      onPressed: () => controller.onFirstInMessageUnReadData(),
      onRefresh: () => controller.onRefreshMessageUnReadData(),
      onLoadMore: () => controller.onLoadMoreMessageUnReadData(),
      refreshController: controller.refreshController,
      header: const ClassicHeader(),
      lottieRocketRefreshHeader: false,
      child: CustomScrollView(
        controller: controller.scrollController,
        slivers: [_messageUnReadList(controller)],
      ),
    );
  }
  Widget _messageUnReadList(MessageUnreadListController controller) {
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