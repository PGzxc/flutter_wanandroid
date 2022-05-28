// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_outside_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectOutSideResponse _$CollectOutSideResponseFromJson(
        Map<String, dynamic> json) =>
    CollectOutSideResponse(
      Data.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$CollectOutSideResponseToJson(
        CollectOutSideResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['author'] as String,
      json['chapterId'] as int,
      json['chapterName'] as String,
      json['courseId'] as int,
      json['desc'] as String,
      json['envelopePic'] as String,
      json['id'] as int,
      json['link'] as String,
      json['niceDate'] as String,
      json['origin'] as String,
      json['originId'] as int,
      json['publishTime'] as int,
      json['title'] as String,
      json['userId'] as int,
      json['visible'] as int,
      json['zan'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'author': instance.author,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'envelopePic': instance.envelopePic,
      'id': instance.id,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'origin': instance.origin,
      'originId': instance.originId,
      'publishTime': instance.publishTime,
      'title': instance.title,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan,
    };
