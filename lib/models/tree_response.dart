import 'package:json_annotation/json_annotation.dart';

part 'tree_response.g.dart';

///2-2.1 体系数据

@JsonSerializable()
class TreeResponse extends Object {

  @JsonKey(name: 'data')
  List<TreeItem> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  TreeResponse(this.data,this.errorCode,this.errorMsg,);

  factory TreeResponse.fromJson(Map<String, dynamic> srcJson) => _$TreeResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TreeResponseToJson(this);

}


@JsonSerializable()
class TreeItem extends Object {

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'children')
  List<Children> children;

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

  TreeItem(this.author,this.children,this.courseId,this.cover,this.desc,this.id,this.lisense,this.lisenseLink,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory TreeItem.fromJson(Map<String, dynamic> srcJson) => _$TreeItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TreeItemToJson(this);

}


@JsonSerializable()
class Children extends Object {

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

  Children(this.author,this.children,this.courseId,this.cover,this.desc,this.id,this.lisense,this.lisenseLink,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory Children.fromJson(Map<String, dynamic> srcJson) => _$ChildrenFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChildrenToJson(this);

}


