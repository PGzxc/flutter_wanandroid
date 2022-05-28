import 'dart:convert';

class BaseResponse<LinkHashMap> {
  bool success = false;
  String? errorMsg;
  int? errorCode;
  LinkHashMap? data;

  BaseResponse({
    this.errorMsg,
    required this.success,
    this.errorCode,
    this.data,
  });
  BaseResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && json['data'] != 'null') {
      data = json['data'];
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
    success = json['errorCode'] == 0;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['errorCode'] = errorCode;
    data['errorMsg'] = errorMsg;
    data['success'] = success;
    return data;
  }

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"errorMsg\":\"$errorMsg\"");
    sb.write(",\"errorCode\":$errorCode");
    sb.write(",\"success\":$success");
    sb.write(",\"data\":${json.encode(data)}");
    sb.write('}');
    return sb.toString();
  }
}
