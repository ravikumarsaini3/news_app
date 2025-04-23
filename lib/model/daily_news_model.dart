// To parse this JSON data, do
//
//     final dailyNewsModel = dailyNewsModelFromJson(jsonString);

import 'dart:convert';

DailyNewsModel dailyNewsModelFromJson(String str) => DailyNewsModel.fromJson(json.decode(str));

String dailyNewsModelToJson(DailyNewsModel data) => json.encode(data.toJson());

class DailyNewsModel {
  String status;
  int totalResults;
  List<Article2> articles;

  DailyNewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory DailyNewsModel.fromJson(Map<String, dynamic> json) => DailyNewsModel(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article2>.from(json["articles"].map((x) => Article2.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article2 {
  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String content;

  Article2({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article2.fromJson(Map<String, dynamic> json) => Article2(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Source {
  String? id;
  String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
