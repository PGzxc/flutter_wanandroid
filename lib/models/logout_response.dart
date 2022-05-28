import 'package:json_annotation/json_annotation.dart';

part 'logout_response.g.dart';

///5登陆与注册-5.3 退出

@JsonSerializable()
class LogoutResponse extends Object {

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  LogoutResponse(this.errorCode,this.errorMsg,);

  factory LogoutResponse.fromJson(Map<String, dynamic> srcJson) => _$LogoutResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);

}


