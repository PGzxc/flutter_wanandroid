import 'package:json_annotation/json_annotation.dart';

part 'square_private_shared_delete_response.g.dart';

///10分享-10.4 删除自己分享的文章

@JsonSerializable()
class SquarePrivateSharedDeleteResponse extends Object {

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  SquarePrivateSharedDeleteResponse(this.errorCode,this.errorMsg,);

  factory SquarePrivateSharedDeleteResponse.fromJson(Map<String, dynamic> srcJson) => _$SquarePrivateSharedDeleteResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SquarePrivateSharedDeleteResponseToJson(this);

}


