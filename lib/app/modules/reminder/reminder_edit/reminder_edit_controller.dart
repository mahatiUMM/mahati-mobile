import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/reminder_id_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderEditController extends GetxController {
  final RestClient restClient = Get.find();
  final RxInt reminderId = 0.obs;
  final Rx<ReminderIdModel?> reminderModel = Rx<ReminderIdModel?>(null);

  TextEditingController medicineNameController = TextEditingController();
  TextEditingController medicineTakenController = TextEditingController();
  TextEditingController medicineTotalController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController causeController = TextEditingController();
  TextEditingController capSizeController = TextEditingController();
  TextEditingController medicineTimeController = TextEditingController();

  @override
  void onInit() {
    reminderId.value = Get.arguments;
    getReminder();
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
        "/reminder/$reminderId", HttpMethod.GET, null, token.toString());

    if (result.statusCode == 200) {
      reminderModel.value = ReminderIdModel.fromMap(jsonDecode(result.body));
    } else {
      print('Request failed with status: ${result.statusCode}');
    }
  }

  Future<void> editReminder() async {
    final userId = await getUserId();
    final data = {
      "user_id": userId?.toInt(),
      "medicine_name": (medicineNameController.value.text.isEmpty
          ? reminderModel.value?.data.medicineName
          : medicineNameController.value.text),
      "medicine_taken": (medicineTakenController.value.text.isEmpty
          ? reminderModel.value?.data.medicineTaken
          : int.parse(medicineTakenController.value.text)),
      "medicine_total": (medicineTotalController.value.text.isEmpty
          ? reminderModel.value?.data.medicineTotal
          : int.parse(medicineTotalController.value.text)),
      "amount": (amountController.value.text.isEmpty
          ? reminderModel.value?.data.amount
          : int.parse(amountController.value.text)),
      "cause": (causeController.value.text.isEmpty
          ? reminderModel.value?.data.cause
          : causeController.value.text),
      "cap_size": (capSizeController.value.text.isEmpty
          ? reminderModel.value?.data.capSize
          : int.parse(capSizeController.value.text)),
      "medicine_time": (medicineTimeController.value.text.isEmpty
          ? reminderModel.value?.data.medicineTime
          : medicineTimeController.value.text)
    };

    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/reminder/$reminderId", HttpMethod.PATCH, data, token.toString());

    if (result.statusCode == 200) {
      Get.offAllNamed("/layout");
      Get.snackbar(
        'Berhasil mengedit pengingat obat',
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
      return;
    } else {
      print('Request failed with status: ${result.statusCode}');
      Get.snackbar(
        'Gagal mengedit pengingat obat',
        'Mohon lengkapi semua data yang diperlukan',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Resources.color.textFieldColor,
        colorText: Resources.color.baseColor,
        leftBarIndicatorColor: Resources.color.secondaryColor1,
        overlayColor: Resources.color.primaryColor,
        progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(
          Resources.color.secondaryColor,
        ),
        animationDuration: const Duration(milliseconds: 500),
        icon: Icon(Icons.error, color: Resources.color.baseColor, size: 20.0),
      );
      return;
    }
  }
}
