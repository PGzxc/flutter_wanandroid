import 'package:json_annotation/json_annotation.dart';

part 'square_shared_article_response.g.dart';

///10分享-10.5 分享文章

@JsonSerializable()
class SquareSharedArticleResponse extends Object {

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  SquareSharedArticleResponse(this.errorCode,this.errorMsg,);

  factory SquareSharedArticleResponse.fromJson(Map<String, dynamic> srcJson) => _$SquareSharedArticleResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SquareSharedArticleResponseToJson(this);

}


