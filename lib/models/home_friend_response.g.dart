// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_friend_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeFriendResponse _$HomeFriendResponseFromJson(Map<String, dynamic> json) =>
    HomeFriendResponse(
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$HomeFriendResponseToJson(HomeFriendResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['category'] as String,
      json['icon'] as String,
      json['id'] as int,
      json['link'] as String,
      json['name'] as String,
      json['order'] as int,
      json['visible'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'category': instance.category,
      'icon': instance.icon,
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
