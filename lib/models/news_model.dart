import 'dart:convert';

class NewsModel {
  String status;
  int totalResults;
  List<Article> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsModel.fromRawJson(String str) =>
      NewsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    status: json["status"] ?? '',
    totalResults: json["totalResults"] ?? 0,
    articles: json["articles"] == null
        ? []
        : List<Article>.from(
        json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  String source;
  String author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory Article.fromRawJson(String str) =>
      Article.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: json["source"]["name"] ?? '',
    author: json["author"] ?? '',
    title: json["title"] ?? '',
    description: json["description"],
    url: json["url"] ?? '',
    urlToImage: json["urlToImage"],
    publishedAt: json["publishedAt"] != null
        ? DateTime.parse(json["publishedAt"])
        : DateTime.now(),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}
