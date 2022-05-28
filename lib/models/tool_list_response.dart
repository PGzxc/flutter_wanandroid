import 'package:json_annotation/json_annotation.dart';

part 'tool_list_response.g.dart';

///17. 工具列表接口

@JsonSerializable()
class ToolListResponse extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  ToolListResponse(this.data,this.errorCode,this.errorMsg,);

  factory ToolListResponse.fromJson(Map<String, dynamic> srcJson) => _$ToolListResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ToolListResponseToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'isNew')
  int isNew;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'showInTab')
  int showInTab;

  @JsonKey(name: 'tabName')
  String tabName;

  @JsonKey(name: 'visible')
  int visible;

  Data(this.desc,this.icon,this.id,this.isNew,this.link,this.name,this.order,this.showInTab,this.tabName,this.visible,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


