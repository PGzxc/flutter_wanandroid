import 'package:json_annotation/json_annotation.dart';

part 'login_register_response.g.dart';

///5-登陆与注册实体化类

@JsonSerializable()
class LoginRegisterResponse extends Object {
  @JsonKey(name: 'data')
  UserInfo data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  LoginRegisterResponse(
    this.data,
    this.errorCode,
    this.errorMsg,
  );

  factory LoginRegisterResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$LoginRegisterResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginRegisterResponseToJson(this);
}

@JsonSerializable()
class UserInfo extends Object {
  @JsonKey(name: 'admin')
  bool? admin;

  @JsonKey(name: 'chapterTops')
  List<dynamic>? chapterTops;

  @JsonKey(name: 'coinCount')
  int? coinCount;

  @JsonKey(name: 'collectIds')
  List<dynamic>? collectIds;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'icon')
  String? icon;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'nickname')
  String? nickname;

  @JsonKey(name: 'password')
  String? password;

  @JsonKey(name: 'publicName')
  String? publicName;

  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'username')
  String? username;

  UserInfo(
  {
    this.admin,
    this.chapterTops,
    this.coinCount,
    this.collectIds,
    this.email,
    this.icon,
    this.id,
    this.nickname,
    this.password,
    this.publicName,
    this.token,
    this.type,
    this.username,
}
  );

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
