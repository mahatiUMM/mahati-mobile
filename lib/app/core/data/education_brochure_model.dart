import 'dart:convert';

class Brochure {
  bool success;
  List<BrochureImage> data;

  Brochure({
    required this.success,
    required this.data,
  });

  factory Brochure.fromRawJson(String str) =>
      Brochure.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Brochure.fromJson(Map<String, dynamic> json) => Brochure(
        success: json["success"],
        data: List<BrochureImage>.from(
            json["data"].map((x) => BrochureImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class BrochureImage {
  int id;
  String title;
  DateTime createdAt;
  dynamic updatedAt;
  List<Image> images;

  BrochureImage({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  factory BrochureImage.fromRawJson(String str) =>
      BrochureImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BrochureImage.fromJson(Map<String, dynamic> json) => BrochureImage(
        id: json["id"],
        title: json["title"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  int id;
  String imagePath;
  int brochureId;

  Image({
    required this.id,
    required this.imagePath,
    required this.brochureId,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        imagePath: json["imagePath"],
        brochureId: json["brochureId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagePath": imagePath,
        "brochureId": brochureId,
      };
}
