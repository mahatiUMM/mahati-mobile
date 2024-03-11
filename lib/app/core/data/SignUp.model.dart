// To parse this JSON data, do
//
//     final signUp = signUpFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  String username;
  String email;
  String password;
  String number;
  dynamic photo;

  SignUpModel({
    required this.username,
    required this.email,
    required this.password,
    required this.number,
    required this.photo,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        number: json["number"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "number": number,
        "photo": photo,
      };
}
