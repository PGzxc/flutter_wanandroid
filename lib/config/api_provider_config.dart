import 'package:flutter_wanandroid/provider/api_provider.dart';
import 'package:get/get.dart';

class APIProviderConfig extends GetxService {

  Future<APIProviderConfig> init() async {
    Get.put(ApiProvider());
    return this;
  }

  ApiProvider getAPiProvider() {
    return Get.find<ApiProvider>();
  }
}
