// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_read_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageReadListResponse _$MessageReadListResponseFromJson(
        Map<String, dynamic> json) =>
    MessageReadListResponse(
      MessageData.fromJson(json['data'] as Map<String, dynamic>),
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

MessageData _$MessageDataFromJson(Map<String, dynamic> json) => MessageData(
      curPage: json['curPage'] as int?,
      datas: (json['datas'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      offset: json['offset'] as int?,
      over: json['over'] as bool?,
      pageCount: json['pageCount'] as int?,
      size: json['size'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$MessageDataToJson(MessageData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
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

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
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
