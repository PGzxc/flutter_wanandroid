// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_delete_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TODODeleteResponse _$TODODeleteResponseFromJson(Map<String, dynamic> json) =>
    TODODeleteResponse(
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$TODODeleteResponseToJson(TODODeleteResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
