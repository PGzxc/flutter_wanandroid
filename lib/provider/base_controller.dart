import 'package:get/get.dart';

import '../config/api_provider_config.dart';
import 'api_provider.dart';


class BaseController<T> extends GetxController with StateMixin<T>{
  ApiProvider provider = Get.find<APIProviderConfig>().getAPiProvider();
  static final  _isLogin = false.obs;
  get isLogin => _isLogin.value;
  set isLogin(value) => _isLogin.value = value;


}