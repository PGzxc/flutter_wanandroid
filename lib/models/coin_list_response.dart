import 'package:json_annotation/json_annotation.dart';

part 'coin_list_response.g.dart';

///9 积分-获取个人积分获取列表

@JsonSerializable()
class CoinListResponse extends Object {
  @JsonKey(name: 'data')
  CoinListData data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  CoinListResponse(
    this.data,
    this.errorCode,
    this.errorMsg,
  );

  factory CoinListResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$CoinListResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoinListResponseToJson(this);
}

@JsonSerializable()
class CoinListData extends Object {
  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<CoinData>? datas;

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

  CoinListData(
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  );

  factory CoinListData.fromJson(Map<String, dynamic> srcJson) =>
      _$CoinListDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoinListDataToJson(this);
}

@JsonSerializable()
class CoinData extends Object {
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

  CoinData(
    this.coinCount,
    this.date,
    this.desc,
    this.id,
    this.reason,
    this.type,
    this.userId,
    this.userName,
  );

  factory CoinData.fromJson(Map<String, dynamic> srcJson) =>
      _$CoinDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoinDataToJson(this);
}
