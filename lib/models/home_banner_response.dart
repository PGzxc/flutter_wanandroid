import 'package:json_annotation/json_annotation.dart';
part 'home_banner_response.g.dart';

///1.2 首页-首页banner
@JsonSerializable()
class HomeBannerResponse extends Object {
  @JsonKey(name: 'data')
  List<Banner> data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  HomeBannerResponse(
    this.data,
    this.errorCode,
    this.errorMsg,
  );

  factory HomeBannerResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeBannerResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeBannerResponseToJson(this);
}

@JsonSerializable()
class Banner extends Object {
  @JsonKey(name: 'desc')
  String? desc;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'imagePath')
  String? imagePath;

  @JsonKey(name: 'isVisible')
  int? isVisible;

  @JsonKey(name: 'order')
  int? order;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'url')
  String? url;

  Banner({
    this.desc,
    this.id,
    this.imagePath,
    this.isVisible,
    this.order,
    this.title,
    this.type,
    this.url,
  });

  factory Banner.fromJson(Map<String, dynamic> srcJson) =>
      _$BannerFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
