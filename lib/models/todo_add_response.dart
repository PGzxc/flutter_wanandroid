import 'package:json_annotation/json_annotation.dart';

part 'todo_add_response.g.dart';

///TODO-新增一个 TODO

@JsonSerializable()
class TODOAddResponse extends Object {

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  TODOAddResponse(this.data,this.errorCode,this.errorMsg,);

  factory TODOAddResponse.fromJson(Map<String, dynamic> srcJson) => _$TODOAddResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TODOAddResponseToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'completeDateStr')
  String completeDateStr;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'date')
  int date;

  @JsonKey(name: 'dateStr')
  String dateStr;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'priority')
  int priority;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userId')
  int userId;

  Data(this.completeDateStr,this.content,this.date,this.dateStr,this.id,this.priority,this.status,this.title,this.type,this.userId,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


