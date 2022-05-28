import 'package:json_annotation/json_annotation.dart';

part 'hot_key_response.g.dart';

///1.4 首页-搜索热词
@JsonSerializable()
class HotKeyResponse extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  HotKeyResponse(this.data,this.errorCode,this.errorMsg,);

  factory HotKeyResponse.fromJson(Map<String, dynamic> srcJson) => _$HotKeyResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotKeyResponseToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'visible')
  int visible;

  Data(this.id,this.link,this.name,this.order,this.visible,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


