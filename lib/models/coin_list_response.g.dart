// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinListResponse _$CoinListResponseFromJson(Map<String, dynamic> json) =>
    CoinListResponse(
      CoinListData.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$CoinListResponseToJson(CoinListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

CoinListData _$CoinListDataFromJson(Map<String, dynamic> json) => CoinListData(
      json['curPage'] as int,
      (json['datas'] as List<dynamic>?)
          ?.map((e) => CoinData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['offset'] as int,
      json['over'] as bool,
      json['pageCount'] as int,
      json['size'] as int,
      json['total'] as int,
    );

Map<String, dynamic> _$CoinListDataToJson(CoinListData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

CoinData _$CoinDataFromJson(Map<String, dynamic> json) => CoinData(
      json['coinCount'] as int,
      json['date'] as int,
      json['desc'] as String,
      json['id'] as int,
      json['reason'] as String,
      json['type'] as int,
      json['userId'] as int,
      json['userName'] as String,
    );

Map<String, dynamic> _$CoinDataToJson(CoinData instance) => <String, dynamic>{
      'coinCount': instance.coinCount,
      'date': instance.date,
      'desc': instance.desc,
      'id': instance.id,
      'reason': instance.reason,
      'type': instance.type,
      'userId': instance.userId,
      'userName': instance.userName,
    };
