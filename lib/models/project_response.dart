import 'package:json_annotation/json_annotation.dart';

part 'project_response.g.dart';

///4-4.1 项目分类

@JsonSerializable()
class ProjectResponse extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  ProjectResponse(this.data,this.errorCode,this.errorMsg,);

  factory ProjectResponse.fromJson(Map<String, dynamic> srcJson) => _$ProjectResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectResponseToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'children')
  List<dynamic> children;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'lisense')
  String lisense;

  @JsonKey(name: 'lisenseLink')
  String lisenseLink;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'parentChapterId')
  int parentChapterId;

  @JsonKey(name: 'userControlSetTop')
  bool userControlSetTop;

  @JsonKey(name: 'visible')
  int visible;

  Data(this.author,this.children,this.courseId,this.cover,this.desc,this.id,this.lisense,this.lisenseLink,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


