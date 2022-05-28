// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uncollect_originid_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnCollectOriginIDResponse _$UnCollectOriginIDResponseFromJson(
        Map<String, dynamic> json) =>
    UnCollectOriginIDResponse(
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$UnCollectOriginIDResponseToJson(
        UnCollectOriginIDResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
