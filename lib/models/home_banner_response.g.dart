// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerResponse _$HomeBannerResponseFromJson(Map<String, dynamic> json) =>
    HomeBannerResponse(
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$HomeBannerResponseToJson(HomeBannerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['desc'] as String,
      json['id'] as int,
      json['imagePath'] as String,
      json['isVisible'] as int,
      json['order'] as int,
      json['title'] as String,
      json['type'] as int,
      json['url'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
