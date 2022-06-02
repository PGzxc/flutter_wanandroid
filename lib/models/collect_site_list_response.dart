import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collect_site_list_response.g.dart';

///6 收藏-6.5 收藏网站列表

@JsonSerializable()
class CollectSiteListResponse extends Object {

  @JsonKey(name: 'data')
  List<CollectSite> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  CollectSiteListResponse(this.data,this.errorCode,this.errorMsg,);

  factory CollectSiteListResponse.fromJson(Map<String, dynamic> srcJson) => _$CollectSiteListResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectSiteListResponseToJson(this);

}


@JsonSerializable()
class CollectSite extends Object {

  @JsonKey(name: 'desc')
  String? desc;

  @JsonKey(name: 'icon')
  String? icon;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'link')
  String? link;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'userId')
  int? userId;

  @JsonKey(name: 'visible')
  int? visible;

  bool? collect;
  
  CollectSite({this.desc,this.icon,this.id,this.link,this.name,this.order,this.userId,this.visible});

  factory CollectSite.fromJson(Map<String, dynamic> srcJson) => _$CollectSiteFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectSiteToJson(this);

  /// 可观察变量 isCollect 是否收藏
  final Rx<bool> _isCollect = false.obs;

  get isCollect => _isCollect.value;

  set isCollect(value) => _isCollect.value = value;

}


