import 'package:json_annotation/json_annotation.dart';

part 'message_read_list_response.g.dart';

///14.站内消息列表-14.2 已读消息列表

@JsonSerializable()
class MessageReadListResponse extends Object {

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  MessageReadListResponse(this.data,this.errorCode,this.errorMsg,);

  factory MessageReadListResponse.fromJson(Map<String, dynamic> srcJson) => _$MessageReadListResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MessageReadListResponseToJson(this);

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

  @JsonKey(name: 'category')
  int category;

  @JsonKey(name: 'date')
  int date;

  @JsonKey(name: 'fromUser')
  String fromUser;

  @JsonKey(name: 'fromUserId')
  int fromUserId;

  @JsonKey(name: 'fullLink')
  String fullLink;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'isRead')
  int isRead;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'niceDate')
  String niceDate;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'userId')
  int userId;

  Datas(this.category,this.date,this.fromUser,this.fromUserId,this.fullLink,this.id,this.isRead,this.link,this.message,this.niceDate,this.tag,this.title,this.userId,);

  factory Datas.fromJson(Map<String, dynamic> srcJson) => _$DatasFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DatasToJson(this);

}


