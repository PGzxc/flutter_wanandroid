// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRegisterResponse _$LoginRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    LoginRegisterResponse(
      UserInfo.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$LoginRegisterResponseToJson(
        LoginRegisterResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      admin: json['admin'] as bool?,
      chapterTops: json['chapterTops'] as List<dynamic>?,
      coinCount: json['coinCount'] as int?,
      collectIds: json['collectIds'] as List<dynamic>?,
      email: json['email'] as String?,
      icon: json['icon'] as String?,
      id: json['id'] as int?,
      nickname: json['nickname'] as String?,
      password: json['password'] as String?,
      publicName: json['publicName'] as String?,
      token: json['token'] as String?,
      type: json['type'] as int?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'admin': instance.admin,
      'chapterTops': instance.chapterTops,
      'coinCount': instance.coinCount,
      'collectIds': instance.collectIds,
      'email': instance.email,
      'icon': instance.icon,
      'id': instance.id,
      'nickname': instance.nickname,
      'password': instance.password,
      'publicName': instance.publicName,
      'token': instance.token,
      'type': instance.type,
      'username': instance.username,
    };
