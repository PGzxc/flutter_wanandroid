// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_unread_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageUnreadResponse _$MessageUnreadResponseFromJson(
        Map<String, dynamic> json) =>
    MessageUnreadResponse(
      json['data'] as int,
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$MessageUnreadResponseToJson(
        MessageUnreadResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
