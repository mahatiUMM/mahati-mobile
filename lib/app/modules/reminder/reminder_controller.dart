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

  Future<void> getReminder() async {
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/reminder", HttpMethod.GET, null, token.toString());

    if (result.statusCode == 200) {
      var reminderModel = ReminderModel.fromMap(jsonDecode(result.body));
      reminderList.assignAll(reminderModel.data);
      final userId = await getUserId();

      if (reminderList[0].userId == userId) {
        // TODO: search algorithm for reminderList, from now just use for loop
        for (var i = 0; i < reminderList.length; i++) {
          print(reminderList[i].medicineName);
          print(reminderList[i].medicineTaken);
          print(reminderList[i].medicineTotal);
          print(reminderList[i].amount);
          print("Id ${reminderList[i].id}");
        }
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
