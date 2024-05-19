import 'dart:convert';

import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/reminder_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  RxList<ReminderData> reminderList = <ReminderData>[].obs;

  @override
  void onInit() {
    getReminder();
    getUserId();
    super.onInit();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return int.parse(prefs.getString('userId')!);
  }

  String checkStatus(int status) {
    switch (status) {
      case 0:
        return 'Belum Minum Obat';
      case 1:
        return 'Sudah Minum Obat';
      default:
        return 'Unknown';
    }
  }

  String capSizeToString(int capSize) {
    switch (capSize) {
      case 1:
        return "Tidak Kuat";
      case 2:
        return "Sedang";
      case 3:
        return "Kuat";
      default:
        return 'Unknown';
    }
  }

  Future<void> getReminder() async {
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/reminder", HttpMethod.GET, null, token.toString());

    if (result.statusCode == 200) {
      var reminderModel = ReminderModel.fromMap(jsonDecode(result.body));
      final userId = await getUserId();
      reminderList.assignAll(reminderModel.data);

      if (reminderList[0].userId == userId) {
        print("Data ditemukan");
      } else {
        print("Data tidak ditemukan");
      }
    } else {
      print('Request failed with status: ${result.statusCode}');
    }
  }

  // dummy data
  String title = "Paracetamol XL2";
  String status = "Completed Minum Obat";
  String strong = "Sangat Kuat";
  String time = "02.30";
}
