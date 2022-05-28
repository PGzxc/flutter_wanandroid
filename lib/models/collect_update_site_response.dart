import 'package:json_annotation/json_annotation.dart';

part 'collect_update_site_response.g.dart';

///6 收藏-6.7 编辑收藏网站

@JsonSerializable()
class CollectUpdateSiteResponse extends Object {

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  CollectUpdateSiteResponse(this.data,this.errorCode,this.errorMsg,);

  factory CollectUpdateSiteResponse.fromJson(Map<String, dynamic> srcJson) => _$CollectUpdateSiteResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectUpdateSiteResponseToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'visible')
  int visible;

  Data(this.desc,this.icon,this.id,this.link,this.name,this.order,this.userId,this.visible,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


