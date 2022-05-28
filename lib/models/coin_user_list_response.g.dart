// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_user_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinUserListResponse _$CoinUserListResponseFromJson(
        Map<String, dynamic> json) =>
    CoinUserListResponse(
      Data.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$CoinUserListResponseToJson(
        CoinUserListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['curPage'] as int,
      (json['datas'] as List<dynamic>)
          .map((e) => Datas.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['offset'] as int,
      json['over'] as bool,
      json['pageCount'] as int,
      json['size'] as int,
      json['total'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

Datas _$DatasFromJson(Map<String, dynamic> json) => Datas(
      json['coinCount'] as int,
      json['date'] as int,
      json['desc'] as String,
      json['id'] as int,
      json['reason'] as String,
      json['type'] as int,
      json['userId'] as int,
      json['userName'] as String,
    );

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'coinCount': instance.coinCount,
      'date': instance.date,
      'desc': instance.desc,
      'id': instance.id,
      'reason': instance.reason,
      'type': instance.type,
      'userId': instance.userId,
      'userName': instance.userName,
    };
