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
    super.onInit();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> getReminder() async {
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/reminder", HttpMethod.GET, null, token.toString());
    // Map<String, dynamic> responseBody = jsonDecode(result.body);
    // var successData = responseBody['success'];
    // var reminderData = responseBody['data'];
    // print(successData);
    // print(reminderData);

    if (result.statusCode == 200) {
      var reminderModel = ReminderModel.fromMap(jsonDecode(result.body));

      // use for loop to get the data
      for (var i = 0; i < reminderModel.data.length; i++) {
        reminderList.add(reminderModel.data[i]);
      }

      print(reminderList[0].medicineName);
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
