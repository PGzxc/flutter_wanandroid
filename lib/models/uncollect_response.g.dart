// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uncollect_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnCollectResponse _$UnCollectResponseFromJson(Map<String, dynamic> json) =>
    UnCollectResponse(
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$UnCollectResponseToJson(UnCollectResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
