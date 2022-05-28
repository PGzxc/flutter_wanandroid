// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToolListResponse _$ToolListResponseFromJson(Map<String, dynamic> json) =>
    ToolListResponse(
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$ToolListResponseToJson(ToolListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['desc'] as String,
      json['icon'] as String,
      json['id'] as int,
      json['isNew'] as int,
      json['link'] as String,
      json['name'] as String,
      json['order'] as int,
      json['showInTab'] as int,
      json['tabName'] as String,
      json['visible'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'desc': instance.desc,
      'icon': instance.icon,
      'id': instance.id,
      'isNew': instance.isNew,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'showInTab': instance.showInTab,
      'tabName': instance.tabName,
      'visible': instance.visible,
    };
