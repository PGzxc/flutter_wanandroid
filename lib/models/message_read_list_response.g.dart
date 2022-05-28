// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_read_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageReadListResponse _$MessageReadListResponseFromJson(
        Map<String, dynamic> json) =>
    MessageReadListResponse(
      Data.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$MessageReadListResponseToJson(
        MessageReadListResponse instance) =>
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
      json['category'] as int,
      json['date'] as int,
      json['fromUser'] as String,
      json['fromUserId'] as int,
      json['fullLink'] as String,
      json['id'] as int,
      json['isRead'] as int,
      json['link'] as String,
      json['message'] as String,
      json['niceDate'] as String,
      json['tag'] as String,
      json['title'] as String,
      json['userId'] as int,
    );

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'category': instance.category,
      'date': instance.date,
      'fromUser': instance.fromUser,
      'fromUserId': instance.fromUserId,
      'fullLink': instance.fullLink,
      'id': instance.id,
      'isRead': instance.isRead,
      'link': instance.link,
      'message': instance.message,
      'niceDate': instance.niceDate,
      'tag': instance.tag,
      'title': instance.title,
      'userId': instance.userId,
    };
