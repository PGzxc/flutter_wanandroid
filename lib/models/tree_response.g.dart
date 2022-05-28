// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreeResponse _$TreeResponseFromJson(Map<String, dynamic> json) => TreeResponse(
      (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$TreeResponseToJson(TreeResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['author'] as String,
      (json['children'] as List<dynamic>)
          .map((e) => Children.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['courseId'] as int,
      json['cover'] as String,
      json['desc'] as String,
      json['id'] as int,
      json['lisense'] as String,
      json['lisenseLink'] as String,
      json['name'] as String,
      json['order'] as int,
      json['parentChapterId'] as int,
      json['userControlSetTop'] as bool,
      json['visible'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'author': instance.author,
      'children': instance.children,
      'courseId': instance.courseId,
      'cover': instance.cover,
      'desc': instance.desc,
      'id': instance.id,
      'lisense': instance.lisense,
      'lisenseLink': instance.lisenseLink,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) => Children(
      json['author'] as String,
      json['children'] as List<dynamic>,
      json['courseId'] as int,
      json['cover'] as String,
      json['desc'] as String,
      json['id'] as int,
      json['lisense'] as String,
      json['lisenseLink'] as String,
      json['name'] as String,
      json['order'] as int,
      json['parentChapterId'] as int,
      json['userControlSetTop'] as bool,
      json['visible'] as int,
    );

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'author': instance.author,
      'children': instance.children,
      'courseId': instance.courseId,
      'cover': instance.cover,
      'desc': instance.desc,
      'id': instance.id,
      'lisense': instance.lisense,
      'lisenseLink': instance.lisenseLink,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
