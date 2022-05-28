import 'package:json_annotation/json_annotation.dart';

part 'coin_user_list_response.g.dart';

///9 积分-获取个人积分获取列表

@JsonSerializable()
class CoinUserListResponse extends Object {

  @JsonKey(name: 'data')
  Data data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  CoinUserListResponse(this.data,this.errorCode,this.errorMsg,);

  factory CoinUserListResponse.fromJson(Map<String, dynamic> srcJson) => _$CoinUserListResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoinUserListResponseToJson(this);

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

  @JsonKey(name: 'coinCount')
  int coinCount;

  @JsonKey(name: 'date')
  int date;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'reason')
  String reason;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'userName')
  String userName;

  Datas(this.coinCount,this.date,this.desc,this.id,this.reason,this.type,this.userId,this.userName,);

  factory Datas.fromJson(Map<String, dynamic> srcJson) => _$DatasFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DatasToJson(this);

}


