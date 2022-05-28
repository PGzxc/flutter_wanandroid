// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_user_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinUserInfoResponse _$CoinUserInfoResponseFromJson(
        Map<String, dynamic> json) =>
    CoinUserInfoResponse(
      CoinUserInfo.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$CoinUserInfoResponseToJson(
        CoinUserInfoResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

CoinUserInfo _$CoinUserInfoFromJson(Map<String, dynamic> json) => CoinUserInfo(
      coinCount: json['coinCount'] as int?,
      level: json['level'] as int?,
      nickname: json['nickname'] as String?,
      rank: json['rank'] as String?,
      userId: json['userId'] as int?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$CoinUserInfoToJson(CoinUserInfo instance) =>
    <String, dynamic>{
      'coinCount': instance.coinCount,
      'level': instance.level,
      'nickname': instance.nickname,
      'rank': instance.rank,
      'userId': instance.userId,
      'username': instance.username,
    };
