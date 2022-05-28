import 'package:json_annotation/json_annotation.dart';

part 'uncollect_response.g.dart';

/// 6-收藏-6.4.2 我的收藏页面（该页面包含自己录入的内容）取消

@JsonSerializable()
class UnCollectResponse extends Object {

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  UnCollectResponse(this.errorCode,this.errorMsg,);

  factory UnCollectResponse.fromJson(Map<String, dynamic> srcJson) => _$UnCollectResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UnCollectResponseToJson(this);

}


