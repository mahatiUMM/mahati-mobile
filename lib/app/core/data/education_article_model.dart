import 'dart:convert';

class Article {
  bool success;
  List<ArticleData> data;

  Article({
    required this.success,
    required this.data,
  });

  factory Article.fromRawJson(String str) => Article.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        success: json["success"],
        data: List<ArticleData>.from(
            json["data"].map((x) => ArticleData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ArticleData {
  int id;
  String title;
  String description;
  String file;
  DateTime createdAt;
  dynamic updatedAt;

  ArticleData({
    required this.id,
    required this.title,
    required this.description,
    required this.file,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ArticleData.fromRawJson(String str) =>
      ArticleData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArticleData.fromJson(Map<String, dynamic> json) => ArticleData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        file: json["file"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "file": file,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}
