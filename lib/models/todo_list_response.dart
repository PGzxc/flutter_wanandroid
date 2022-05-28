import 'package:json_annotation/json_annotation.dart';

part 'todo_list_response.g.dart';

///TODO-5. TODO 列表

@JsonSerializable()
class TODOListResponse extends Object {

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  TODOListResponse(this.data,this.errorCode,this.errorMsg,);

  factory TODOListResponse.fromJson(Map<String, dynamic> srcJson) => _$TODOListResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TODOListResponseToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<Datas> datas;

  @JsonKey(name: 'offset')
  int offset;

  @JsonKey(name: 'over')
  bool over;

  @JsonKey(name: 'pageCount')
  int pageCount;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'total')
  int total;

  Data(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class Datas extends Object {

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

  Datas(this.completeDateStr,this.content,this.date,this.dateStr,this.id,this.priority,this.status,this.title,this.type,this.userId,);

  factory Datas.fromJson(Map<String, dynamic> srcJson) => _$DatasFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DatasToJson(this);

}


