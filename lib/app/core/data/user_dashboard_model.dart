import 'dart:convert';

class UserDashboard {
  bool success;
  Data data;

  UserDashboard({
    required this.success,
    required this.data,
  });

  factory UserDashboard.fromRawJson(String str) =>
      UserDashboard.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDashboard.fromJson(Map<String, dynamic> json) => UserDashboard(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  int remainingMedicine;
  List<LowerMedicine> lowerMedicine;
  RecentBloodPressure recentBloodPressure;

  Data({
    required this.remainingMedicine,
    required this.lowerMedicine,
    required this.recentBloodPressure,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        remainingMedicine: json["remaining_reminder"],
        lowerMedicine: List<LowerMedicine>.from(
            json["lower_medicine"].map((x) => LowerMedicine.fromJson(x))),
        recentBloodPressure:
            RecentBloodPressure.fromJson(json["recent_blood_pressure"]),
      );

  Map<String, dynamic> toJson() => {
        "remaining_reminder": remainingMedicine,
        "lower_medicine":
            List<dynamic>.from(lowerMedicine.map((x) => x.toJson())),
        "recent_blood_pressure": recentBloodPressure.toJson(),
      };
}

class LowerMedicine {
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

  LowerMedicine({
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

  factory LowerMedicine.fromRawJson(String str) =>
      LowerMedicine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LowerMedicine.fromJson(Map<String, dynamic> json) => LowerMedicine(
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

class RecentBloodPressure {
  int id;
  int userId;
  String image;
  int sistol;
  int diastole;
  int heartbeat;
  DateTime createdAt;
  dynamic updatedAt;

  RecentBloodPressure({
    required this.id,
    required this.userId,
    required this.image,
    required this.sistol,
    required this.diastole,
    required this.heartbeat,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RecentBloodPressure.fromRawJson(String str) =>
      RecentBloodPressure.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecentBloodPressure.fromJson(Map<String, dynamic> json) =>
      RecentBloodPressure(
        id: json["id"],
        userId: json["user_id"],
        image: json["image"],
        sistol: json["sistol"],
        diastole: json["diastole"],
        heartbeat: json["heartbeat"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "image": image,
        "sistol": sistol,
        "diastole": diastole,
        "heartbeat": heartbeat,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}
