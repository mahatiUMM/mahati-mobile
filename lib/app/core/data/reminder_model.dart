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
  DateTime expiredAt;
  DateTime createdAt;
  dynamic updatedAt;
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
    required this.expiredAt,
    required this.createdAt,
    required this.updatedAt,
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
        expiredAt: DateTime.parse(json["expired_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] ?? "",
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
        "expired_at": expiredAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "schedules": List<dynamic>.from(schedules!.map((x) => x)),
      };
}
