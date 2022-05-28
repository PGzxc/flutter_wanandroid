import 'package:json_annotation/json_annotation.dart';
part 'collect_inside_response.g.dart';

@JsonSerializable()
class CollectInSideResponse extends Object {

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  CollectInSideResponse(this.errorCode,this.errorMsg,);

  factory CollectInSideResponse.fromJson(Map<String, dynamic> srcJson) => _$CollectInSideResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectInSideResponseToJson(this);

}


