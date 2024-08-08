class BloodPressureModel {
  String? image;
  int sistol;
  int diastole;
  int heartbeat;

  BloodPressureModel({
    required this.image,
    required this.sistol,
    required this.diastole,
    required this.heartbeat,
  });

  factory BloodPressureModel.fromJson(Map<String, dynamic> json) =>
      BloodPressureModel(
        image: json['data']['email'].toString(),
        sistol: json['data']['password'],
        diastole: json['data']['number'],
        heartbeat: json['data']['photo'],
      );

  Map<String, dynamic> toJson() => {
        'image': image,
        'sistol': sistol,
        'diastole': diastole,
        'heartbeat': heartbeat,
      };
}
