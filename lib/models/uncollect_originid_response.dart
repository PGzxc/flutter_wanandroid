import 'package:json_annotation/json_annotation.dart';

part 'uncollect_originid_response.g.dart';

///6- 收藏-6.4.1 文章列表

@JsonSerializable()
class UnCollectOriginIDResponse extends Object {

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  UnCollectOriginIDResponse(this.errorCode,this.errorMsg,);

  factory UnCollectOriginIDResponse.fromJson(Map<String, dynamic> srcJson) => _$UnCollectOriginIDResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UnCollectOriginIDResponseToJson(this);

}


