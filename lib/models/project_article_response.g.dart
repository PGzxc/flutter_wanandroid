// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_article_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectArticleResponse _$ProjectArticleResponseFromJson(
        Map<String, dynamic> json) =>
    ProjectArticleResponse(
      ProjectData.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$ProjectArticleResponseToJson(
        ProjectArticleResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

ProjectData _$ProjectDataFromJson(Map<String, dynamic> json) => ProjectData(
      json['curPage'] as int,
      (json['datas'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['offset'] as int,
      json['over'] as bool,
      json['pageCount'] as int,
      json['size'] as int,
      json['total'] as int,
    );

Map<String, dynamic> _$ProjectDataToJson(ProjectData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };
