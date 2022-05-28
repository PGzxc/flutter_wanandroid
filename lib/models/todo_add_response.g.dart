// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_add_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TODOAddResponse _$TODOAddResponseFromJson(Map<String, dynamic> json) =>
    TODOAddResponse(
      Data.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$TODOAddResponseToJson(TODOAddResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['completeDateStr'] as String,
      json['content'] as String,
      json['date'] as int,
      json['dateStr'] as String,
      json['id'] as int,
      json['priority'] as int,
      json['status'] as int,
      json['title'] as String,
      json['type'] as int,
      json['userId'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'completeDateStr': instance.completeDateStr,
      'content': instance.content,
      'date': instance.date,
      'dateStr': instance.dateStr,
      'id': instance.id,
      'priority': instance.priority,
      'status': instance.status,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
    };
