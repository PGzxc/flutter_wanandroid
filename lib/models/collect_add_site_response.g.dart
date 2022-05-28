// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_add_site_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectAddSiteResponse _$CollectAddSiteResponseFromJson(
        Map<String, dynamic> json) =>
    CollectAddSiteResponse(
      Data.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$CollectAddSiteResponseToJson(
        CollectAddSiteResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['desc'] as String,
      json['icon'] as String,
      json['id'] as int,
      json['link'] as String,
      json['name'] as String,
      json['order'] as int,
      json['userId'] as int,
      json['visible'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'desc': instance.desc,
      'icon': instance.icon,
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'userId': instance.userId,
      'visible': instance.visible,
    };
