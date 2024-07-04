// To parse this JSON data, do
//
//     final reminderModel = reminderModelFromMap(jsonString);

import 'dart:convert';

ReminderModel reminderModelFromMap(String str) =>
    ReminderModel.fromMap(json.decode(str));

String reminderModelToMap(ReminderModel data) => json.encode(data.toMap());

class ReminderModel {
  bool success;
  List<ReminderData> data;

  ReminderModel({
    required this.success,
    required this.data,
  });

  factory ReminderModel.fromMap(Map<String, dynamic> json) => ReminderModel(
        success: json["success"],
        data: List<ReminderData>.from(
            json["data"].map((x) => ReminderData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class ReminderData {
  int id;
  int userId;
  String medicineName;
  String medicineTime;
  int medicineTaken;
  int medicineTotal;
  int amount;
  String cause;
  int capSize;
  DateTime createdAt;
  dynamic updatedAt;
  User user;
  List<dynamic>? schedules;

  ReminderData({
    required this.id,
    required this.userId,
    required this.medicineName,
    required this.medicineTime,
    required this.medicineTaken,
    required this.medicineTotal,
    required this.amount,
    required this.cause,
    required this.capSize,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.schedules,
  });

  factory ReminderData.fromMap(Map<String, dynamic> json) => ReminderData(
        id: json["id"],
        userId: json["user_id"],
        medicineName: json["medicine_name"],
        medicineTaken: json["medicine_taken"],
        medicineTotal: json["medicine_total"],
        amount: json["amount"] ?? 0,
        cause: json["cause"] ?? "",
        capSize: json["cap_size"],
        medicineTime: json["medicine_time"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] ?? "",
        user: User.fromMap(json["user"]),
        schedules: json["schedules"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "medicine_name": medicineName,
        "medicine_time": medicineTime,
        "medicine_taken": medicineTaken,
        "medicine_total": medicineTotal,
        "amount": amount,
        "cause": cause,
        "cap_size": capSize,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "user": user.toMap(),
        "schedules": List<dynamic>.from(schedules!.map((x) => x)),
      };
}

class User {
  int id;
  String username;
  String email;
  String password;
  String number;
  String? photo;
  DateTime createdAt;
  dynamic updatedAt;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.number,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        number: json["number"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
        "number": number,
        "photo": photo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}
