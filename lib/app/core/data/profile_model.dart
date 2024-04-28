import 'dart:convert';

ProfileModel profileFromJson(String str) =>
    ProfileModel.fromJSON(json.decode(str));

String profileToJson(ProfileModel data) => json.encode(data.toJSON());

class ProfileModel {
  String? accessToken;

  ProfileModel({
    required this.accessToken,
  });

  factory ProfileModel.fromJSON(Map<String, dynamic> json) => ProfileModel(
        accessToken: json["access_token"].toString(),
      );

  Map<String, dynamic> toJSON() => {
        "access_token": accessToken,
      };
}

class UserModel {
  String id;
  String username;
  String email;
  String password;
  String number;
  dynamic photo;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.number,
    required this.photo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['user']['id'].toString(),
        username: json['user']['username'].toString(),
        email: json['user']['email'].toString(),
        password: json['user']['password'].toString(),
        number: json['user']['number'].toString(),
        photo: json['user']['photo'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'password': password,
        'number': number,
        'photo': photo,
      };
}
