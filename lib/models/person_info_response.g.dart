// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonInfoResponse _$PersonInfoResponseFromJson(Map<String, dynamic> json) =>
    PersonInfoResponse(
      PersonInfoData.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$PersonInfoResponseToJson(PersonInfoResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

PersonInfoData _$PersonInfoDataFromJson(Map<String, dynamic> json) =>
    PersonInfoData(
      coinInfo: json['coinInfo'] == null
          ? null
          : CoinInfo.fromJson(json['coinInfo'] as Map<String, dynamic>),
      collectArticleInfo: json['collectArticleInfo'] == null
          ? null
          : CollectArticleInfo.fromJson(
              json['collectArticleInfo'] as Map<String, dynamic>),
      userInfo: json['userInfo'] == null
          ? null
          : UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonInfoDataToJson(PersonInfoData instance) =>
    <String, dynamic>{
      'coinInfo': instance.coinInfo,
      'collectArticleInfo': instance.collectArticleInfo,
      'userInfo': instance.userInfo,
    };

CoinInfo _$CoinInfoFromJson(Map<String, dynamic> json) => CoinInfo(
      json['coinCount'] as int,
      json['level'] as int,
      json['nickname'] as String,
      json['rank'] as String,
      json['userId'] as int,
      json['username'] as String,
    );

Map<String, dynamic> _$CoinInfoToJson(CoinInfo instance) => <String, dynamic>{
      'coinCount': instance.coinCount,
      'level': instance.level,
      'nickname': instance.nickname,
      'rank': instance.rank,
      'userId': instance.userId,
      'username': instance.username,
    };

CollectArticleInfo _$CollectArticleInfoFromJson(Map<String, dynamic> json) =>
    CollectArticleInfo(
      json['count'] as int,
    );

Map<String, dynamic> _$CollectArticleInfoToJson(CollectArticleInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      json['admin'] as bool,
      json['chapterTops'] as List<dynamic>,
      json['coinCount'] as int,
      (json['collectIds'] as List<dynamic>).map((e) => e as int).toList(),
      json['email'] as String,
      json['icon'] as String,
      json['id'] as int,
      json['nickname'] as String,
      json['password'] as String,
      json['publicName'] as String,
      json['token'] as String,
      json['type'] as int,
      json['username'] as String,
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
