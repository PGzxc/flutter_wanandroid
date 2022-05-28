import 'package:flutter_wanandroid/provider/base_response.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class ApiErrorHandler {
  /// [HttpStatus] from [Response]. `status.connectionError` is true
  /// when statusCode is null. `status.isUnauthorized` is true when
  /// statusCode is equal `401`. `status.isNotFound` is true when
  /// statusCode is equal `404`. `status.isServerError` is true when
  /// statusCode is between `500` and `599`.
  String returnErrorString(Response response) {
    switch (response.statusCode) {
      case 400:
        //throw BadRequestException(response.body.toString());
        return '无效请求';
      case 401:
        return '未认证';
      case 403:
        //throw UnauthorisedException(response.body.toString());
        return '未认证';
      case 404:
        return '找不到资源';
      case 500:
        return '服务器错误';
      default:
        //throw FetchDataException('服务器通信时出错 : ${response.statusCode}');
        return '服务器通信时出错 : ${response.statusCode}';
    }
  }

  BaseResponse returnErrorBaseResponse(Response response) {
    switch (response.statusCode) {
      case 400:
        return BaseResponse(errorCode: 400, errorMsg: '无效请求', success: false, data: null);
      case 401:
        return BaseResponse(errorCode: 401, errorMsg: '未认证', success: false, data: null);
      case 403:
        return BaseResponse(errorCode: 403, errorMsg: '未认证', success: false, data: null);
      case 404:
        return BaseResponse(errorCode: 404, errorMsg: '找不到资源', success: false, data: null);
      case 500:
        return BaseResponse(errorCode: 500, errorMsg: '服务器错误', success: false, data: null);
      default:
        return BaseResponse(errorCode: -1, errorMsg: '服务器通信时出错', success: false, data: null);
    }
  }
}
