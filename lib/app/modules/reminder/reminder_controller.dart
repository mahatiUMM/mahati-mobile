import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/reminder_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:mahati_mobile/app/utils/resources.dart';

class ReminderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RestClient restClient = Get.find<RestClient>();
  RxList<ReminderData> reminderList = <ReminderData>[].obs;
  RxList<ReminderData> filteredReminders = <ReminderData>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getReminder();
    getUserId();
    ever(
      Get.currentRoute.obs,
      (callback) => {
        if (callback == '/reminder') {getReminder()}
      },
    );
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
      filterRemindersByDate(DateTime.now());
    } else {
    }
    isLoading.value = false;
  }

  Future<void> exportUserReminder() async {
    final token = await getToken();
    final restClient = Get.find<RestClient>();
    final result = await restClient.requestWithToken(
      "/export/reminder",
      HttpMethod.GET,
      null,
      token.toString(),
    );
    final directory = Directory("/storage/emulated/0/Download");
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    final filePath = path.join(directory.path, "reminder.xlsx");
    final file = File(filePath);
    await file.writeAsBytes(result.bodyBytes);
    Get.snackbar(
      "Export Data Pengingat",
      "Berhasil, file tersimpan di Download",
      backgroundColor: Resources.color.primaryColor,
      colorText: Resources.color.whiteColor,
      duration: const Duration(seconds: 5),
    );
  }

  void filterRemindersByDate(DateTime date) {
    filteredReminders.assignAll(reminderList
        .where((element) =>
            element.createdAt.toLocal().toString().substring(0, 10) ==
            date.toLocal().toString().substring(0, 10))
        .toList());

  }
}
