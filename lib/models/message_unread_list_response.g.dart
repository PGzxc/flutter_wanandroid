// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_unread_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageUnReadListResponse _$MessageUnReadListResponseFromJson(
        Map<String, dynamic> json) =>
    MessageUnReadListResponse(
      MessageUnreadData.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$MessageUnReadListResponseToJson(
        MessageUnReadListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

MessageUnreadData _$MessageUnreadDataFromJson(Map<String, dynamic> json) =>
    MessageUnreadData(
      json['curPage'] as int,
      (json['datas'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['offset'] as int,
      json['over'] as bool,
      json['pageCount'] as int,
      json['size'] as int,
      json['total'] as int,
    );

Map<String, dynamic> _$MessageUnreadDataToJson(MessageUnreadData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };
