import 'dart:convert';

class EducationVideo {
  bool success;
  List<VideoModel> data;

  EducationVideo({
    required this.success,
    required this.data,
  });

  factory EducationVideo.fromRawJson(String str) =>
      EducationVideo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EducationVideo.fromJson(Map<String, dynamic> json) => EducationVideo(
        success: json["success"],
        data: List<VideoModel>.from(
            json["data"].map((x) => VideoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class VideoModel {
  int id;
  String link;
  int userId;
  String title;
  String authorName;
  String authorUrl;
  String thumbnailUrl;
  bool isBookmarked;
  DateTime createdAt;
  dynamic updatedAt;

  VideoModel({
    required this.id,
    required this.link,
    required this.userId,
    required this.title,
    required this.authorName,
    required this.authorUrl,
    required this.thumbnailUrl,
    required this.isBookmarked,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VideoModel.fromRawJson(String str) =>
      VideoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        link: json["link"],
        userId: json["user_id"],
        title: json["title"],
        authorName: json["author_name"],
        authorUrl: json["author_url"],
        thumbnailUrl: json["thumbnail_url"],
        isBookmarked: json["is_bookmarked"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "user_id": userId,
        "title": title,
        "author_name": authorName,
        "author_url": authorUrl,
        "thumbnail_url": thumbnailUrl,
        "is_bookmarked": isBookmarked,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}
