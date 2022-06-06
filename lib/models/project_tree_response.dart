import 'package:json_annotation/json_annotation.dart';

part 'project_tree_response.g.dart';

///4-4.1 项目分类

@JsonSerializable()
class ProjectTreeResponse extends Object {

  @JsonKey(name: 'data')
  List<Project> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  ProjectTreeResponse(this.data,this.errorCode,this.errorMsg,);

  factory ProjectTreeResponse.fromJson(Map<String, dynamic> srcJson) => _$ProjectTreeResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectTreeResponseToJson(this);

}


@JsonSerializable()
class Project extends Object {

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

  Project(this.author,this.children,this.courseId,this.cover,this.desc,this.id,this.lisense,this.lisenseLink,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory Project.fromJson(Map<String, dynamic> srcJson) => _$ProjectFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

}


