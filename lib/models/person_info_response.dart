import 'package:json_annotation/json_annotation.dart';

part 'person_info_response.g.dart';

///12. 个人信息接口

@JsonSerializable()
class PersonInfoResponse extends Object {

  @JsonKey(name: 'data')
  PersonInfoData data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  PersonInfoResponse(this.data,this.errorCode,this.errorMsg,);

  factory PersonInfoResponse.fromJson(Map<String, dynamic> srcJson) => _$PersonInfoResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PersonInfoResponseToJson(this);

}


@JsonSerializable()
class PersonInfoData extends Object {

  @JsonKey(name: 'coinInfo')
  CoinInfo? coinInfo;

  @JsonKey(name: 'collectArticleInfo')
  CollectArticleInfo? collectArticleInfo;

  @JsonKey(name: 'userInfo')
  UserInfo? userInfo;

  PersonInfoData({this.coinInfo,this.collectArticleInfo,this.userInfo,});

  factory PersonInfoData.fromJson(Map<String, dynamic> srcJson) => _$PersonInfoDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PersonInfoDataToJson(this);

}


@JsonSerializable()
class CoinInfo extends Object {

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

  CoinInfo(this.coinCount,this.level,this.nickname,this.rank,this.userId,this.username,);

  factory CoinInfo.fromJson(Map<String, dynamic> srcJson) => _$CoinInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoinInfoToJson(this);

}


@JsonSerializable()
class CollectArticleInfo extends Object {

  @JsonKey(name: 'count')
  int count;

  CollectArticleInfo(this.count,);

  factory CollectArticleInfo.fromJson(Map<String, dynamic> srcJson) => _$CollectArticleInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CollectArticleInfoToJson(this);

}


@JsonSerializable()
class UserInfo extends Object {

  @JsonKey(name: 'admin')
  bool admin;

  @JsonKey(name: 'chapterTops')
  List<dynamic> chapterTops;

  @JsonKey(name: 'coinCount')
  int coinCount;

  @JsonKey(name: 'collectIds')
  List<int> collectIds;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'publicName')
  String publicName;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'username')
  String username;

  UserInfo(this.admin,this.chapterTops,this.coinCount,this.collectIds,this.email,this.icon,this.id,this.nickname,this.password,this.publicName,this.token,this.type,this.username,);

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) => _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

}


