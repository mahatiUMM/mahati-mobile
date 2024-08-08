import 'dart:convert';

class Bookmark {
  bool success;
  List<BookmarkData> data;

  Bookmark({
    required this.success,
    required this.data,
  });

  factory Bookmark.fromRawJson(String str) =>
      Bookmark.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        success: json["success"],
        data: List<BookmarkData>.from(
            json["data"].map((x) => BookmarkData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BookmarkData {
  int? id;
  int videoId;
  int? userId;
  DateTime? createdAt;
  dynamic updatedAt;

  BookmarkData({
    required this.id,
    required this.videoId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookmarkData.fromRawJson(String str) =>
      BookmarkData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookmarkData.fromJson(Map<String, dynamic> json) => BookmarkData(
        id: json["id"],
        videoId: json["video_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "video_id": videoId,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
      };
}
