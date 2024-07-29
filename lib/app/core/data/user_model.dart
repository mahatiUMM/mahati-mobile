class User {
  int id;
  String username;
  String email;
  String password;
  String number;
  String photo;
  DateTime createdAt;
  DateTime? updatedAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.number,
    required this.photo,
    required this.createdAt,
    this.updatedAt,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        number: json["number"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "number": number,
        "photo": photo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
