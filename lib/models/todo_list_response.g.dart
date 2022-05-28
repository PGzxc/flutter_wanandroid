// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TODOListResponse _$TODOListResponseFromJson(Map<String, dynamic> json) =>
    TODOListResponse(
      Data.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$TODOListResponseToJson(TODOListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['curPage'] as int,
      (json['datas'] as List<dynamic>)
          .map((e) => Datas.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['offset'] as int,
      json['over'] as bool,
      json['pageCount'] as int,
      json['size'] as int,
      json['total'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

Datas _$DatasFromJson(Map<String, dynamic> json) => Datas(
      json['completeDateStr'] as String,
      json['content'] as String,
      json['date'] as int,
      json['dateStr'] as String,
      json['id'] as int,
      json['priority'] as int,
      json['status'] as int,
      json['title'] as String,
      json['type'] as int,
      json['userId'] as int,
    );

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'completeDateStr': instance.completeDateStr,
      'content': instance.content,
      'date': instance.date,
      'dateStr': instance.dateStr,
      'id': instance.id,
      'priority': instance.priority,
      'status': instance.status,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
    };
