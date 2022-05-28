import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/logger/logger_util.dart';

class GetConfig extends GetxService{

  Future<GetConfig> init() async{

    Get.config(
      defaultOpaqueRoute: Get.isOpaqueRouteDefault,
      enableLog: false,
      defaultPopGesture: true,
      defaultTransition: Transition.leftToRightWithFade,
      logWriterCallback: localLogWriter,
    );
    await Get.putAsync(()=>SharedPreferences.getInstance());
    return this;
  }

  void localLogWriter(String text, {bool isError = false}) {
    LoggerUtil.d(text);
    //Logger.write(text);

    // pass the message to your favourite logging package here
    // please note that even if enableLog: false log messages will be pushed in this callback
    // you get check the flag if you want through GetConfig.isLogEnable
  }

}