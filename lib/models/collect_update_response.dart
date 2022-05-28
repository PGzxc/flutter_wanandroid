import 'package:json_annotation/json_annotation.dart';
part 'collect_update_response.g.dart';

///6 收藏-6。3 [新增] 编辑收藏的文章，支持站内，站外
@JsonSerializable()
class CollectUpdateResponse extends Object {
  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  CollectUpdateResponse(
    this.errorCode,
    this.errorMsg,
  );

  factory CollectUpdateResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$CollectUpdateResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectUpdateResponseToJson(this);
}
