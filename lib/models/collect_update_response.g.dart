// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectUpdateResponse _$CollectUpdateResponseFromJson(
        Map<String, dynamic> json) =>
    CollectUpdateResponse(
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$CollectUpdateResponseToJson(
        CollectUpdateResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
