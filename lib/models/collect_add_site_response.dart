import 'package:json_annotation/json_annotation.dart';
part 'collect_add_site_response.g.dart';

///6-收藏-6.6 收藏网址

@JsonSerializable()
class CollectAddSiteResponse extends Object {

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  CollectAddSiteResponse(this.data,this.errorCode,this.errorMsg,);

  factory CollectAddSiteResponse.fromJson(Map<String, dynamic> srcJson) => _$CollectAddSiteResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectAddSiteResponseToJson(this);

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


