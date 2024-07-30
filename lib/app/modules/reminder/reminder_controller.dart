import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/reminder_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:timezone/standalone.dart';
import 'package:timezone/timezone.dart' as tz;

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:mahati_mobile/app/utils/resources.dart';

class ReminderController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RestClient restClient = Get.find<RestClient>();
  RxList<ReminderData> reminderList = <ReminderData>[].obs;
  RxBool isLoading = true.obs;
  RxString selectedDate = DateTime.now().toString().obs;

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

  bool checkStatus(List<dynamic>? schedules, String time) {
    DateTime selectedDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(time);

    if (schedules != null) {
      for (var schedule in schedules) {
        final scheduleDate = tz.TZDateTime.from(
            DateTime.parse(schedule['time']), getLocation('Asia/Jakarta'));

        if (scheduleDate.year == selectedDate.year &&
            scheduleDate.month == selectedDate.month &&
            scheduleDate.day == selectedDate.day) {
          return true;
        }
      }
    }

    return false;
  }

  String capSizeToString(int capSize) {
    switch (capSize) {
      case 1:
        return "Terbatas";
      case 2:
        return "Bebas Keras";
      case 3:
        return "Keras";
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
      reminderList.assignAll(reminderModel.data);
    } else {}
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

    final filePath = path.join(directory.path,
        "reminder-${DateTime.now().millisecondsSinceEpoch}.xlsx");
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
}
