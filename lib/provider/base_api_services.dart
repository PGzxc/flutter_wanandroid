import 'package:get/get_connect/connect.dart';

abstract class BaseApiServices {
  ///5-登陆与注册
  Future<dynamic> loginRegister(String request, Map<String, String> loginMap);
  ///5.3 退出登陆
  Future<dynamic> logout();

  ///9-积分API
  ///9.1-积分排行榜接口
  Future<dynamic> coinRank();
  ///9.2-获取个人积分，需要登录后访问
  Future<dynamic> coinUserInfo();
  ///9.3-获取个人积分获取列表，需要登录后访问
  Future<dynamic> coinList();


  Future<dynamic> getNews();
  Future<Response> getEverthing(String s);
}
