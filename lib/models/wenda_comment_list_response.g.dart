// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wenda_comment_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WenDaCommentListResponse _$WenDaCommentListResponseFromJson(
        Map<String, dynamic> json) =>
    WenDaCommentListResponse(
      Data.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String,
    );

Map<String, dynamic> _$WenDaCommentListResponseToJson(
        WenDaCommentListResponse instance) =>
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
      json['anonymous'] as int,
      json['appendForContent'] as int,
      json['articleId'] as int,
      json['canEdit'] as bool,
      json['content'] as String,
      json['contentMd'] as String,
      json['id'] as int,
      json['niceDate'] as String,
      json['publishDate'] as int,
      json['replyCommentId'] as int,
      (json['replyComments'] as List<dynamic>)
          .map((e) => ReplyComments.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['rootCommentId'] as int,
      json['status'] as int,
      json['toUserId'] as int,
      json['toUserName'] as String,
      json['userId'] as int,
      json['userName'] as String,
      json['zan'] as int,
    );

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      'anonymous': instance.anonymous,
      'appendForContent': instance.appendForContent,
      'articleId': instance.articleId,
      'canEdit': instance.canEdit,
      'content': instance.content,
      'contentMd': instance.contentMd,
      'id': instance.id,
      'niceDate': instance.niceDate,
      'publishDate': instance.publishDate,
      'replyCommentId': instance.replyCommentId,
      'replyComments': instance.replyComments,
      'rootCommentId': instance.rootCommentId,
      'status': instance.status,
      'toUserId': instance.toUserId,
      'toUserName': instance.toUserName,
      'userId': instance.userId,
      'userName': instance.userName,
      'zan': instance.zan,
    };

ReplyComments _$ReplyCommentsFromJson(Map<String, dynamic> json) =>
    ReplyComments(
      json['anonymous'] as int,
      json['appendForContent'] as int,
      json['articleId'] as int,
      json['canEdit'] as bool,
      json['content'] as String,
      json['contentMd'] as String,
      json['id'] as int,
      json['niceDate'] as String,
      json['publishDate'] as int,
      json['replyCommentId'] as int,
      json['replyComments'] as List<dynamic>,
      json['rootCommentId'] as int,
      json['status'] as int,
      json['toUserId'] as int,
      json['toUserName'] as String,
      json['userId'] as int,
      json['userName'] as String,
      json['zan'] as int,
    );

Map<String, dynamic> _$ReplyCommentsToJson(ReplyComments instance) =>
    <String, dynamic>{
      'anonymous': instance.anonymous,
      'appendForContent': instance.appendForContent,
      'articleId': instance.articleId,
      'canEdit': instance.canEdit,
      'content': instance.content,
      'contentMd': instance.contentMd,
      'id': instance.id,
      'niceDate': instance.niceDate,
      'publishDate': instance.publishDate,
      'replyCommentId': instance.replyCommentId,
      'replyComments': instance.replyComments,
      'rootCommentId': instance.rootCommentId,
      'status': instance.status,
      'toUserId': instance.toUserId,
      'toUserName': instance.toUserName,
      'userId': instance.userId,
      'userName': instance.userName,
      'zan': instance.zan,
    };
