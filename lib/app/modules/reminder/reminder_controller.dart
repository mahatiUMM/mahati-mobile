import 'dart:convert';

import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/reminder_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  RxList<ReminderData> reminderList = <ReminderData>[].obs;
  RxList<ReminderData> filteredReminders = <ReminderData>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getReminder();
    getUserId();
    ever(
      Get.currentRoute.obs,
      (callback) => {
        if (callback == '/reminder') {getReminder()}
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
    getReminder();
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
    // TODO: add status on backend and change this logic
    // right now, status 0 is not taken, status 1 is taken
    if (status > 0) {
      return "Sudah Diminum";
    } else {
      return "Belum Diminum";
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
    isLoading.value = true;
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/reminder", HttpMethod.GET, null, token.toString());

    if (result.statusCode == 200) {
      var reminderModel = ReminderModel.fromMap(jsonDecode(result.body));
      final userId = await getUserId();

      reminderModel.data.removeWhere((element) => element.userId != userId);
      reminderList.assignAll(reminderModel.data);
      filterRemindersByDate(DateTime.now().toIso8601String().substring(0, 10));
    } else {
      print('Request failed with status: ${result.statusCode}');
    }
    isLoading.value = false;
  }

  void filterRemindersByDate(String date) {
    print("Date now: ${date}");
    filteredReminders.assignAll(reminderList
        .where((element) =>
            element.medicineTime.length >= 10 &&
            element.medicineTime.substring(0, 10) == date)
        .toList());
  }
}
