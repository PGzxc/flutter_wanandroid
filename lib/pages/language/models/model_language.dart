///设置-语言-Model
class Language {
  ///语言
  String? name;

  ///语言标识符
  String? language;

  ///国家码
  String? country;

  ///是否被选中
  bool? isSelect = false;

  Language({this.name, this.language, this.country, this.isSelect = false});

  Language.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        language = json['language'],
        country = json['country'],
        isSelect = json['isSelect'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['language'] = language;
    data['country'] = country;
    data['isSelect'] = isSelect;
    return data;
  }
}
