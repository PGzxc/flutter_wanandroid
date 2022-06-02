// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_site_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectSiteListResponse _$CollectSiteListResponseFromJson(
        Map<String, dynamic> json) =>
    CollectSiteListResponse(
      (json['data'] as List<dynamic>)
          .map((e) => CollectSite.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$CollectSiteListResponseToJson(
        CollectSiteListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

CollectSite _$CollectSiteFromJson(Map<String, dynamic> json) => CollectSite(
      desc: json['desc'] as String?,
      icon: json['icon'] as String?,
      id: json['id'] as int?,
      link: json['link'] as String?,
      name: json['name'] as String?,
      order: json['order'] as int?,
      userId: json['userId'] as int?,
      visible: json['visible'] as int?,
    )
      ..collect = json['collect'] as bool?
      ..isCollect = json['isCollect'];

Map<String, dynamic> _$CollectSiteToJson(CollectSite instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'icon': instance.icon,
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'userId': instance.userId,
      'visible': instance.visible,
      'collect': instance.collect,
      'isCollect': instance.isCollect,
    };
