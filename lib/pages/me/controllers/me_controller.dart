import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_wanandroid/models/person_info_response.dart';
import 'package:flutter_wanandroid/provider/base_controller.dart';
import 'package:flutter_wanandroid/res/constant.dart';
import 'package:get/get.dart';
import '../../../provider/request_api.dart';

/// 日期：2022-05-15
/// 描述：主页-主屏页面-Body-me-控制器
/// 说明：

class MeController extends BaseController<Rx<PersonInfoData>> {
  Rx<PersonInfoData> personInfoData = PersonInfoData().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    //getUserInfo();
  }

  Future<void> getUserInfo() async {
    httpManager(
        loadingType: Constant.noLoading,
        future: provider.get(RequestAPI.userInfo),
        onSuccess: (response) {
          personInfoData(PersonInfoData.fromJson(response));
        },
        onFail: (value) {
          EasyLoading.showInfo('${value.errorMsg}');
        },
        onError: (error) {
          EasyLoading.showInfo('${error.errorMsg}');
        });
  }
}
