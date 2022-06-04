// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wx_article_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WXArticleListResponse _$WXArticleListResponseFromJson(
        Map<String, dynamic> json) =>
    WXArticleListResponse(
      (json['data'] as List<dynamic>)
          .map((e) => WXItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$WXArticleListResponseToJson(
        WXArticleListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

WXItem _$WXItemFromJson(Map<String, dynamic> json) => WXItem(
      author: json['author'] as String?,
      children: json['children'] as List<dynamic>?,
      courseId: json['courseId'] as int?,
      cover: json['cover'] as String?,
      desc: json['desc'] as String?,
      id: json['id'] as int?,
      lisense: json['lisense'] as String?,
      lisenseLink: json['lisenseLink'] as String?,
      name: json['name'] as String?,
      order: json['order'] as int?,
      parentChapterId: json['parentChapterId'] as int?,
      userControlSetTop: json['userControlSetTop'] as bool?,
      visible: json['visible'] as int?,
    );

Map<String, dynamic> _$WXItemToJson(WXItem instance) => <String, dynamic>{
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
