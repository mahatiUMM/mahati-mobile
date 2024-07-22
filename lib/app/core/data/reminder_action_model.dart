import 'dart:convert';

class ReminderAction {
  bool success;
  Data data;

  ReminderAction({
    required this.success,
    required this.data,
  });

  factory ReminderAction.fromRawJson(String str) =>
      ReminderAction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReminderAction.fromJson(Map<String, dynamic> json) => ReminderAction(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
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
  dynamic updatedAt;

  Data({
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
    required this.updatedAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
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
        "updated_at": updatedAt,
      };
}
