// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_key_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotKeyResponse _$HotKeyResponseFromJson(Map<String, dynamic> json) =>
    HotKeyResponse(
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$HotKeyResponseToJson(HotKeyResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as int,
      json['link'] as String,
      json['name'] as String,
      json['order'] as int,
      json['visible'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
