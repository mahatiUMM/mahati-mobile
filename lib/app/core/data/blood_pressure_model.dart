class BloodPressureModel {
  int user_id;
  String image;
  int sistol;
  int diastole;
  int heartbeat;

  BloodPressureModel({
    required this.user_id,
    required this.image,
    required this.sistol,
    required this.diastole,
    required this.heartbeat,
  });

  factory BloodPressureModel.fromJson(Map<String, dynamic> json) =>
      BloodPressureModel(
        user_id: json['data']['user_id'],
        image: json['data']['email'].toString(),
        sistol: json['data']['password'],
        diastole: json['data']['number'],
        heartbeat: json['data']['photo'],
      );

  Map<String, dynamic> toJson() => {
        'user_id': user_id,
        'image': image,
        'sistol': sistol,
        'diastole': diastole,
        'heartbeat': heartbeat,
      };
}
