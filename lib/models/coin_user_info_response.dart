import 'package:json_annotation/json_annotation.dart';
part 'coin_user_info_response.g.dart';

///9 积分-获取个人积分

@JsonSerializable()
class CoinUserInfoResponse extends Object {

  @JsonKey(name: 'data')
  CoinUserInfo data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  CoinUserInfoResponse(this.data,this.errorCode,this.errorMsg,);

  factory CoinUserInfoResponse.fromJson(Map<String, dynamic> srcJson) => _$CoinUserInfoResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoinUserInfoResponseToJson(this);

}


@JsonSerializable()
class CoinUserInfo extends Object {

  @JsonKey(name: 'coinCount')
  int? coinCount;

  @JsonKey(name: 'level')
  int? level;

  @JsonKey(name: 'nickname')
  String? nickname;

  @JsonKey(name: 'rank')
  String? rank;

  @JsonKey(name: 'userId')
  int? userId;

  @JsonKey(name: 'username')
  String? username;

  CoinUserInfo({this.coinCount,this.level,this.nickname,this.rank,this.userId,this.username,});

  factory CoinUserInfo.fromJson(Map<String, dynamic> srcJson) => _$CoinUserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoinUserInfoToJson(this);

}


