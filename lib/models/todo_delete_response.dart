import 'package:json_annotation/json_annotation.dart';

part 'todo_delete_response.g.dart';

///TODO-3. 删除一个 Todo

@JsonSerializable()
class TODODeleteResponse extends Object {

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  TODODeleteResponse(this.errorCode,this.errorMsg,);

  factory TODODeleteResponse.fromJson(Map<String, dynamic> srcJson) => _$TODODeleteResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TODODeleteResponseToJson(this);

}


