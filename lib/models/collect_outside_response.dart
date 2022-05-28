import 'package:json_annotation/json_annotation.dart';
part 'collect_outside_response.g.dart';

///6 收藏-6.3 收藏站外文章

@JsonSerializable()
class CollectOutSideResponse extends Object {

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  CollectOutSideResponse(this.data,this.errorCode,this.errorMsg,);

  factory CollectOutSideResponse.fromJson(Map<String, dynamic> srcJson) => _$CollectOutSideResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectOutSideResponseToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'chapterId')
  int chapterId;

  @JsonKey(name: 'chapterName')
  String chapterName;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'envelopePic')
  String envelopePic;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'niceDate')
  String niceDate;

  @JsonKey(name: 'origin')
  String origin;

  @JsonKey(name: 'originId')
  int originId;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'visible')
  int visible;

  @JsonKey(name: 'zan')
  int zan;

  Data(this.author,this.chapterId,this.chapterName,this.courseId,this.desc,this.envelopePic,this.id,this.link,this.niceDate,this.origin,this.originId,this.publishTime,this.title,this.userId,this.visible,this.zan,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


