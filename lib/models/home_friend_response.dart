import 'package:json_annotation/json_annotation.dart';
part 'home_friend_response.g.dart';

///1.3 首页-常用网站

@JsonSerializable()
class HomeFriendResponse extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  HomeFriendResponse(this.data,this.errorCode,this.errorMsg,);

  factory HomeFriendResponse.fromJson(Map<String, dynamic> srcJson) => _$HomeFriendResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeFriendResponseToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'category')
  String category;

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

  @JsonKey(name: 'visible')
  int visible;

  Data(this.category,this.icon,this.id,this.link,this.name,this.order,this.visible,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


