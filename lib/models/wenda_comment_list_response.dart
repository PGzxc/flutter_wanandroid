import 'package:json_annotation/json_annotation.dart';

part 'wenda_comment_list_response.g.dart';

///13. 问答评论列表

@JsonSerializable()
class WenDaCommentListResponse extends Object {

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  WenDaCommentListResponse(this.data,this.errorCode,this.errorMsg,);

  factory WenDaCommentListResponse.fromJson(Map<String, dynamic> srcJson) => _$WenDaCommentListResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WenDaCommentListResponseToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<Datas> datas;

  @JsonKey(name: 'offset')
  int offset;

  @JsonKey(name: 'over')
  bool over;

  @JsonKey(name: 'pageCount')
  int pageCount;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'total')
  int total;

  Data(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Datas extends Object {

  @JsonKey(name: 'anonymous')
  int anonymous;

  @JsonKey(name: 'appendForContent')
  int appendForContent;

  @JsonKey(name: 'articleId')
  int articleId;

  @JsonKey(name: 'canEdit')
  bool canEdit;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'contentMd')
  String contentMd;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'niceDate')
  String niceDate;

  @JsonKey(name: 'publishDate')
  int publishDate;

  @JsonKey(name: 'replyCommentId')
  int replyCommentId;

  @JsonKey(name: 'replyComments')
  List<ReplyComments> replyComments;

  @JsonKey(name: 'rootCommentId')
  int rootCommentId;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'toUserId')
  int toUserId;

  @JsonKey(name: 'toUserName')
  String toUserName;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'zan')
  int zan;

  Datas(this.anonymous,this.appendForContent,this.articleId,this.canEdit,this.content,this.contentMd,this.id,this.niceDate,this.publishDate,this.replyCommentId,this.replyComments,this.rootCommentId,this.status,this.toUserId,this.toUserName,this.userId,this.userName,this.zan,);

  factory Datas.fromJson(Map<String, dynamic> srcJson) => _$DatasFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DatasToJson(this);

}


@JsonSerializable()
class ReplyComments extends Object {

  @JsonKey(name: 'anonymous')
  int anonymous;

  @JsonKey(name: 'appendForContent')
  int appendForContent;

  @JsonKey(name: 'articleId')
  int articleId;

  @JsonKey(name: 'canEdit')
  bool canEdit;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'contentMd')
  String contentMd;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'niceDate')
  String niceDate;

  @JsonKey(name: 'publishDate')
  int publishDate;

  @JsonKey(name: 'replyCommentId')
  int replyCommentId;

  @JsonKey(name: 'replyComments')
  List<dynamic> replyComments;

  @JsonKey(name: 'rootCommentId')
  int rootCommentId;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'toUserId')
  int toUserId;

  @JsonKey(name: 'toUserName')
  String toUserName;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'zan')
  int zan;

  ReplyComments(this.anonymous,this.appendForContent,this.articleId,this.canEdit,this.content,this.contentMd,this.id,this.niceDate,this.publishDate,this.replyCommentId,this.replyComments,this.rootCommentId,this.status,this.toUserId,this.toUserName,this.userId,this.userName,this.zan,);

  factory ReplyComments.fromJson(Map<String, dynamic> srcJson) => _$ReplyCommentsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReplyCommentsToJson(this);

}


