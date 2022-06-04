import 'package:json_annotation/json_annotation.dart';

part 'wx_article_list_response.g.dart';

///15.公众号Tab-15.1 获取公众号列表
@JsonSerializable()
class WXArticleListResponse extends Object {
  @JsonKey(name: 'data')
  List<WXItem> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  WXArticleListResponse(
    this.data,
    this.errorCode,
    this.errorMsg,
  );

  factory WXArticleListResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$WXArticleListResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WXArticleListResponseToJson(this);
}

@JsonSerializable()
class WXItem extends Object {
  @JsonKey(name: 'author')
  String? author;

  @JsonKey(name: 'children')
  List<dynamic>? children;

  @JsonKey(name: 'courseId')
  int? courseId;

  @JsonKey(name: 'cover')
  String? cover;

  @JsonKey(name: 'desc')
  String? desc;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'lisense')
  String? lisense;

  @JsonKey(name: 'lisenseLink')
  String? lisenseLink;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'parentChapterId')
  int? parentChapterId;

  @JsonKey(name: 'userControlSetTop')
  bool? userControlSetTop;

  @JsonKey(name: 'visible')
  int? visible;

  WXItem({
    this.author,
    this.children,
    this.courseId,
    this.cover,
    this.desc,
    this.id,
    this.lisense,
    this.lisenseLink,
    this.name,
    this.order,
    this.parentChapterId,
    this.userControlSetTop,
    this.visible,
  });

  factory WXItem.fromJson(Map<String, dynamic> srcJson) =>
      _$WXItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WXItemToJson(this);
}
