import 'package:json_annotation/json_annotation.dart';

import 'home_article_response.dart';

part 'wx_article_history_response.g.dart';

///15.公众号-15.2 查看某个公众号历史数据

@JsonSerializable()
class WXArticleHistoryResponse extends Object {
  @JsonKey(name: 'data')
  WXHistoryData data;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  WXArticleHistoryResponse(
    this.data,
    this.errorCode,
    this.errorMsg,
  );

  factory WXArticleHistoryResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$WXArticleHistoryResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WXArticleHistoryResponseToJson(this);
}

@JsonSerializable()
class WXHistoryData extends Object {
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

  WXHistoryData({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  factory WXHistoryData.fromJson(Map<String, dynamic> srcJson) =>
      _$WXHistoryDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WXHistoryDataToJson(this);
}

// @JsonSerializable()
// class Article extends Object {
//   @JsonKey(name: 'apkLink')
//   String? apkLink;
//
//   @JsonKey(name: 'audit')
//   int? audit;
//
//   @JsonKey(name: 'author')
//   String? author;
//
//   @JsonKey(name: 'canEdit')
//   bool? canEdit;
//
//   @JsonKey(name: 'chapterId')
//   int? chapterId;
//
//   @JsonKey(name: 'chapterName')
//   String? chapterName;
//
//   @JsonKey(name: 'collect')
//   bool? collect;
//
//   @JsonKey(name: 'courseId')
//   int? courseId;
//
//   @JsonKey(name: 'desc')
//   String? desc;
//
//   @JsonKey(name: 'descMd')
//   String? descMd;
//
//   @JsonKey(name: 'envelopePic')
//   String? envelopePic;
//
//   @JsonKey(name: 'fresh')
//   bool? fresh;
//
//   @JsonKey(name: 'host')
//   String? host;
//
//   @JsonKey(name: 'id')
//   int? id;
//
//   @JsonKey(name: 'link')
//   String? link;
//
//   @JsonKey(name: 'niceDate')
//   String? niceDate;
//
//   @JsonKey(name: 'niceShareDate')
//   String? niceShareDate;
//
//   @JsonKey(name: 'origin')
//   String? origin;
//
//   @JsonKey(name: 'prefix')
//   String? prefix;
//
//   @JsonKey(name: 'projectLink')
//   String? projectLink;
//
//   @JsonKey(name: 'publishTime')
//   int? publishTime;
//
//   @JsonKey(name: 'realSuperChapterId')
//   int? realSuperChapterId;
//
//   @JsonKey(name: 'selfVisible')
//   int? selfVisible;
//
//   @JsonKey(name: 'shareDate')
//   int? shareDate;
//
//   @JsonKey(name: 'shareUser')
//   String? shareUser;
//
//   @JsonKey(name: 'superChapterId')
//   int? superChapterId;
//
//   @JsonKey(name: 'superChapterName')
//   String? superChapterName;
//
//   @JsonKey(name: 'tags')
//   List<Tags>? tags;
//
//   @JsonKey(name: 'title')
//   String? title;
//
//   @JsonKey(name: 'type')
//   int? type;
//
//   @JsonKey(name: 'userId')
//   int? userId;
//
//   @JsonKey(name: 'visible')
//   int? visible;
//
//   @JsonKey(name: 'zan')
//   int? zan;
//
//   Article({
//     this.apkLink,
//     this.audit,
//     this.author,
//     this.canEdit,
//     this.chapterId,
//     this.chapterName,
//     this.collect,
//     this.courseId,
//     this.desc,
//     this.descMd,
//     this.envelopePic,
//     this.fresh,
//     this.host,
//     this.id,
//     this.link,
//     this.niceDate,
//     this.niceShareDate,
//     this.origin,
//     this.prefix,
//     this.projectLink,
//     this.publishTime,
//     this.realSuperChapterId,
//     this.selfVisible,
//     this.shareDate,
//     this.shareUser,
//     this.superChapterId,
//     this.superChapterName,
//     this.tags,
//     this.title,
//     this.type,
//     this.userId,
//     this.visible,
//     this.zan,
//   });
//
//   factory Article.fromJson(Map<String, dynamic> srcJson) =>
//       _$ArticleFromJson(srcJson);
//
//   Map<String, dynamic> toJson() => _$ArticleToJson(this);
// }

@JsonSerializable()
class Tags extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'url')
  String url;

  Tags(
    this.name,
    this.url,
  );

  factory Tags.fromJson(Map<String, dynamic> srcJson) =>
      _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}
