import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/models/message_read_list_response.dart';
import 'package:flutter_wanandroid/provider/base_refresh_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sprintf/sprintf.dart';
import '../../../provider/request_api.dart';
import '../../../provider/state/load_state.dart';
import '../../../res/constant.dart';
import '../../../utils/logger/logger_util.dart';
import '../../main/controllers/main_controller.dart';

class MessageUnreadListController extends BaseRefreshController {
  ///未读消息
  final messageUnread = MessageData().obs;

  ///未读消息列表
  final messageUnReadList = RxList<Message>();

  @override
  void onInit() {
    super.onInit();
    onFirstInMessageUnReadData();
  }
  ///获取未读消息接口
  Future<dynamic> getUnReadMessageResponse() async {
    httpManager(
        loadingType: Constant.noLoading,
        future: provider.get(RequestAPI.messageUnread),
        onSuccess: (value) {
          ///消息赋值
          MainController mainController = Get.put(MainController());
          mainController.messageNum = value;
        },
        onFail: (fail) {},
        onError: (error) {});
  }

  /// 第一次进入
  void onFirstInMessageUnReadData() {
    getMessageUnReadData(
      loadingType: Constant.simpleShimmerLoading,
      refreshState: RefreshState.first,
    );
  }

  /// 下拉刷新
  void onRefreshMessageUnReadData() {
    getMessageUnReadData(
      loadingType: Constant.noLoading,
      refreshState: RefreshState.refresh,
    );
  }

  /// 上滑加载更多
  void onLoadMoreMessageUnReadData() {
    LoggerUtil.d('============> onLoadMoreHomeData()', tag: 'HomeController');
    getMessageUnReadData(
      loadingType: Constant.noLoading,
      refreshState: RefreshState.loadMore,
    );
  }

  /// 获取首页数据
  Future<void> getMessageUnReadData({
    required String loadingType,
    required RefreshState refreshState,
  }) async {
    if (refreshState == RefreshState.refresh ||
        refreshState == RefreshState.first) {
      /// 下拉刷新
      currentPage = 1;
    }
    if (refreshState == RefreshState.loadMore) {
      /// 上滑加载更多
      currentPage++;
    }
    LoggerUtil.d('============> getHomeData() $currentPage',
        tag: 'HomeController');
    ///获取未读消息数量
    getUnReadMessageResponse();
    // 获取首页文章列表
    getMessageUnReadList(loadingType, refreshState);
  }

  ///获取首页文章列表
  Future<void> getMessageUnReadList(
      String loadingType, RefreshState refreshState) async {
    String requestUrl = sprintf(RequestAPI.messageUnReadList, [currentPage]);
    httpManagerWithRefreshPaging(
      loadingType: loadingType,
      refreshState: refreshState,
      future: provider.get(requestUrl),
      onSuccess: (response) {
        var messageData = MessageData.fromJson(response);
        List<Message>? dataList = messageData.datas;
        // 加载到底部判断
        var over = messageData.over;
        if (over != null) {
          if (over) {
            loadNoData();
          }
        }
        if (dataList != null && dataList.isNotEmpty) {
          refreshLoadState = LoadState.success;

          if (refreshState == RefreshState.first) {
            messageUnReadList.assignAll(dataList);
          } else if (refreshState == RefreshState.refresh) {
            messageUnReadList.assignAll(dataList);
          } else if (refreshState == RefreshState.loadMore) {
            messageUnReadList.addAll(dataList);
          }
        } else {
          if (loadingType != Constant.noLoading) {
            refreshLoadState = LoadState.empty;
          } else {
            loadNoData();
          }
        }
      },
      onFail: (error) {
        refreshLoadState = LoadState.fail;
        EasyLoading.showToast('数据请求失败 ${error.errorCode}  ${error.errorMsg}');
      },
      onError: (error) {
        refreshLoadState = LoadState.fail;
        EasyLoading.showToast('数据请求失败 ${error.errorCode}  ${error.errorMsg}');
      },
    );
  }
}
