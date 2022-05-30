import 'package:json_annotation/json_annotation.dart';

part 'coin_rank_response.g.dart';

///9 积分-积分排行榜接口

@JsonSerializable()
class CoinRankResponse extends Object {

  @JsonKey(name: 'data')
  CoinRankData data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  CoinRankResponse(this.data,this.errorCode,this.errorMsg,);

  factory CoinRankResponse.fromJson(Map<String, dynamic> srcJson) => _$CoinRankResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoinRankResponseToJson(this);

}


@JsonSerializable()
class CoinRankData extends Object {

  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<RankData> datas;

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

  CoinRankData(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory CoinRankData.fromJson(Map<String, dynamic> srcJson) => _$CoinRankDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoinRankDataToJson(this);

}


@JsonSerializable()
class RankData extends Object {

  @JsonKey(name: 'coinCount')
  int coinCount;

  @JsonKey(name: 'level')
  int level;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'rank')
  String rank;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'username')
  String username;

  RankData(this.coinCount,this.level,this.nickname,this.rank,this.userId,this.username,);

  factory RankData.fromJson(Map<String, dynamic> srcJson) => _$RankDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RankDataToJson(this);

}


