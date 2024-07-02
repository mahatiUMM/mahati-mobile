import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/reminder_id_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
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
    print("Medicine Name: " + medicineNameController.value.text);
    print("Medicine Taken: " + medicineTakenController.value.text);
    print("Medicine Total: " + medicineTotalController.value.text);
    print("Amount: " + amountController.value.text);
    print("Cause: " + causeController.value.text);
    print("Cap size: " + capSizeController.value.text);
    print("Medicine Time: " + medicineTimeController.value.text);

    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/reminder/$reminderId", HttpMethod.PUT, null, token.toString());
  }
}
