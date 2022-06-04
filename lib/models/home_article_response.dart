///1.1 首页-首页文章列表

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:json_annotation/json_annotation.dart';
part 'home_article_response.g.dart';

@JsonSerializable()
class HomeArticleResponse extends Object {
  @JsonKey(name: 'data')
  HomeArticleData data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  HomeArticleResponse(
    this.data,
    this.errorCode,
    this.errorMsg,
  );

  factory HomeArticleResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeArticleResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeArticleResponseToJson(this);
}

@JsonSerializable()
class HomeArticleData extends Object {
  @JsonKey(name: 'curPage')
  int? curPage;

  @JsonKey(name: 'datas')
  List<Article>? datas;

  @JsonKey(name: 'offset')
  int? offset;

  @JsonKey(name: 'over')
  bool? over;

  @JsonKey(name: 'pageCount')
  int? pageCount;

  @JsonKey(name: 'size')
  int? size;

  @JsonKey(name: 'total')
  int? total;

  HomeArticleData({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  factory HomeArticleData.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeArticleDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeArticleDataToJson(this);
}

@JsonSerializable()
class Article extends Object {
  @JsonKey(name: 'apkLink')
  String? apkLink;

  @JsonKey(name: 'audit')
  int? audit;

  @JsonKey(name: 'author')
  String? author;

  @JsonKey(name: 'canEdit')
  bool? canEdit;

  @JsonKey(name: 'chapterId')
  int? chapterId;

  @JsonKey(name: 'chapterName')
  String? chapterName;

  @JsonKey(name: 'collect')
  bool? collect;

  @JsonKey(name: 'courseId')
  int? courseId;

  @JsonKey(name: 'desc')
  String? desc;

  @JsonKey(name: 'descMd')
  String? descMd;

  @JsonKey(name: 'envelopePic')
  String? envelopePic;

  @JsonKey(name: 'fresh')
  bool? fresh;

  @JsonKey(name: 'host')
  String? host;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'link')
  String? link;

  @JsonKey(name: 'niceDate')
  String? niceDate;

  @JsonKey(name: 'niceShareDate')
  String? niceShareDate;

  @JsonKey(name: 'origin')
  String? origin;

  @JsonKey(name: 'prefix')
  String? prefix;

  @JsonKey(name: 'projectLink')
  String? projectLink;

  @JsonKey(name: 'publishTime')
  int? publishTime;

  @JsonKey(name: 'realSuperChapterId')
  int? realSuperChapterId;

  @JsonKey(name: 'selfVisible')
  int? selfVisible;

  @JsonKey(name: 'shareDate')
  int? shareDate;

  @JsonKey(name: 'shareUser')
  String? shareUser;

  @JsonKey(name: 'superChapterId')
  int? superChapterId;

  @JsonKey(name: 'superChapterName')
  String? superChapterName;

  @JsonKey(name: 'tags')
  List<Tags>? tags;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'userId')
  int? userId;

  @JsonKey(name: 'visible')
  int? visible;

  @JsonKey(name: 'zan')
  int? zan;

  Article();

  factory Article.fromJson(Map<String, dynamic> srcJson) =>
      _$ArticleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

}

@JsonSerializable()
class Tags extends Object {
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'url')
  String? url;

  Tags({
    this.name,
    this.url,
  });

  factory Tags.fromJson(Map<String, dynamic> srcJson) =>
      _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}
