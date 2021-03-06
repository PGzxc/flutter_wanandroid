// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_rank_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinRankResponse _$CoinRankResponseFromJson(Map<String, dynamic> json) =>
    CoinRankResponse(
      CoinRankData.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$CoinRankResponseToJson(CoinRankResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

CoinRankData _$CoinRankDataFromJson(Map<String, dynamic> json) => CoinRankData(
      json['curPage'] as int,
      (json['datas'] as List<dynamic>)
          .map((e) => RankData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['offset'] as int,
      json['over'] as bool,
      json['pageCount'] as int,
      json['size'] as int,
      json['total'] as int,
    );

Map<String, dynamic> _$CoinRankDataToJson(CoinRankData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

RankData _$RankDataFromJson(Map<String, dynamic> json) => RankData(
      json['coinCount'] as int,
      json['level'] as int,
      json['nickname'] as String,
      json['rank'] as String,
      json['userId'] as int,
      json['username'] as String,
    );

Map<String, dynamic> _$RankDataToJson(RankData instance) => <String, dynamic>{
      'coinCount': instance.coinCount,
      'level': instance.level,
      'nickname': instance.nickname,
      'rank': instance.rank,
      'userId': instance.userId,
      'username': instance.username,
    };
