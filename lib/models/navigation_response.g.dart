// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavigationResponse _$NavigationResponseFromJson(Map<String, dynamic> json) =>
    NavigationResponse(
      (json['data'] as List<dynamic>)
          .map((e) => NavigatorData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$NavigationResponseToJson(NavigationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

NavigatorData _$NavigatorDataFromJson(Map<String, dynamic> json) =>
    NavigatorData(
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      cid: json['cid'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$NavigatorDataToJson(NavigatorData instance) =>
    <String, dynamic>{
      'articles': instance.articles,
      'cid': instance.cid,
      'name': instance.name,
    };
