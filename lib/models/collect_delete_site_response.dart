import 'package:json_annotation/json_annotation.dart';

part 'collect_delete_site_response.g.dart';

///6 收藏-6.8 删除收藏网站

@JsonSerializable()
class CollectDeleteSiteResponse extends Object {

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  CollectDeleteSiteResponse(this.errorCode,this.errorMsg,);

  factory CollectDeleteSiteResponse.fromJson(Map<String, dynamic> srcJson) => _$CollectDeleteSiteResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectDeleteSiteResponseToJson(this);

}


