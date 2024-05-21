import 'dart:convert';

ReminderIdModel reminderIdModelFromMap(String str) =>
    ReminderIdModel.fromMap(json.decode(str));

String reminderIdModelToMap(ReminderIdModel data) => json.encode(data.toMap());

class ReminderIdModel {
  bool success;
  ReminderIdData data;

  ReminderIdModel({
    required this.success,
    required this.data,
  });

  factory ReminderIdModel.fromMap(Map<String, dynamic> json) => ReminderIdModel(
        success: json["success"],
        data: ReminderIdData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data.toMap(),
      };
}

class ReminderIdData {
  int id;
  int userId;
  String medicineName;
  int medicineTaken;
  int medicineTotal;
  int amount;
  String cause;
  int capSize;
  String medicineTime;
  DateTime createdAt;
  DateTime? updatedAt;
  User user;
  List<dynamic> schedules;

  ReminderIdData({
    required this.id,
    required this.userId,
    required this.medicineName,
    required this.medicineTaken,
    required this.medicineTotal,
    required this.amount,
    required this.cause,
    required this.capSize,
    required this.medicineTime,
    required this.createdAt,
    this.updatedAt,
    required this.user,
    required this.schedules,
  });

  factory ReminderIdData.fromMap(Map<String, dynamic> json) => ReminderIdData(
        id: json["id"],
        userId: json["user_id"],
        medicineName: json["medicine_name"],
        medicineTaken: json["medicine_taken"],
        medicineTotal: json["medicine_total"],
        amount: json["amount"],
        cause: json["cause"],
        capSize: json["cap_size"],
        medicineTime: json["medicine_time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        user: User.fromMap(json["user"]),
        schedules: List<dynamic>.from(json["schedules"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "medicine_name": medicineName,
        "medicine_taken": medicineTaken,
        "medicine_total": medicineTotal,
        "amount": amount,
        "cause": cause,
        "cap_size": capSize,
        "medicine_time": medicineTime,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user.toMap(),
        "schedules": List<dynamic>.from(schedules.map((x) => x)),
      };
}

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
