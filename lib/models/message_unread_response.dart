import 'package:json_annotation/json_annotation.dart';

part 'message_unread_response.g.dart';

///14.站内消息列表-14.1 未读消息数量

@JsonSerializable()
class MessageUnreadResponse extends Object {

  @JsonKey(name: 'data')
  int data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  MessageUnreadResponse(this.data,this.errorCode,this.errorMsg,);

  factory MessageUnreadResponse.fromJson(Map<String, dynamic> srcJson) => _$MessageUnreadResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MessageUnreadResponseToJson(this);

}


