// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wx_article_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WXArticleHistoryResponse _$WXArticleHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    WXArticleHistoryResponse(
      WXHistoryData.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$WXArticleHistoryResponseToJson(
        WXArticleHistoryResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

WXHistoryData _$WXHistoryDataFromJson(Map<String, dynamic> json) =>
    WXHistoryData(
      curPage: json['curPage'] as int?,
      datas: (json['datas'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
      offset: json['offset'] as int?,
      over: json['over'] as bool?,
      pageCount: json['pageCount'] as int?,
      size: json['size'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$WXHistoryDataToJson(WXHistoryData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) => Tags(
      json['name'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
