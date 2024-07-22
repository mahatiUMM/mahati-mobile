import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/reminder_action_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderActionController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  final RxString reminderName = "".obs;
  final RxBool isLoading = true.obs;
  final localData = ReminderAction.fromRawJson(Get.arguments['data']);

  @override
  void onInit() {
    getLatestReminder();
    super.onInit();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> getLatestReminder() async {
    isLoading.value = true;
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/reminder/${localData.data.id}",
        HttpMethod.GET,
        null,
        token.toString());
    if (result.statusCode == 200) {
      var newResult = ReminderAction.fromRawJson(result.body);
      reminderName.value = newResult.data.medicineName;
    } else {}
    isLoading.value = false;
  }

  Future<void> postAcceptReminder() async {
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/accept_reminder/${localData.data.id}",
        HttpMethod.POST,
        null,
        token.toString());
    if (result.statusCode == 200) {
      Get.snackbar(
        'Berhasil minum obat',
        'Data anda sudah berhasil diubah',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Resources.color.textFieldColor,
        colorText: Resources.color.baseColor,
        leftBarIndicatorColor: Resources.color.primaryColor,
        overlayColor: Resources.color.primaryColor,
        progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(
          Resources.color.secondaryColor,
        ),
        animationDuration: const Duration(milliseconds: 500),
        icon: Icon(Icons.error, color: Resources.color.baseColor, size: 20.0),
      );
      Get.offAllNamed("/layout");
    } else {}
  }
}
