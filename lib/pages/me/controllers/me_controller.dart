import 'package:flutter_wanandroid/models/person_info_response.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:get/get.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-me-控制器
/// 说明：

class MeController extends BaseController<Rx<PersonInfoData>> {
  Rx<PersonInfoData> personInfoData = PersonInfoData().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    provider.userInfo().then((value) {
      if (value.success) {
        personInfoData(PersonInfoData.fromJson(value.data));
      }
    });
  }
}
