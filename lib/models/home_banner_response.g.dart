// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerResponse _$HomeBannerResponseFromJson(Map<String, dynamic> json) =>
    HomeBannerResponse(
      (json['data'] as List<dynamic>)
          .map((e) => Banner.fromJson(e as Map<String, dynamic>))
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

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
      desc: json['desc'] as String?,
      id: json['id'] as int?,
      imagePath: json['imagePath'] as String?,
      isVisible: json['isVisible'] as int?,
      order: json['order'] as int?,
      title: json['title'] as String?,
      type: json['type'] as int?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
