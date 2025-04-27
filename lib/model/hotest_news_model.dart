// To parse this JSON data, do
//
//     final hotestNewsModel = hotestNewsModelFromJson(jsonString);

import 'dart:convert';

HotestNewsModel hotestNewsModelFromJson(String str) => HotestNewsModel.fromJson(json.decode(str));

String hotestNewsModelToJson(HotestNewsModel data) => json.encode(data.toJson());

class HotestNewsModel {
  String status;
  int totalResults;
  List<Article> articles;

  HotestNewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory HotestNewsModel.fromJson(Map<String, dynamic> json) => HotestNewsModel(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Source source;
  String? author;
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
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"]??'Unknown',
    title: json["title"]??'No title',
    description: json["description"]??'No description',
    url: json["url"]??'No url',
    urlToImage: json["urlToImage"]??'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s',
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"]??'No content',
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
