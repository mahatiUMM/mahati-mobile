import 'dart:convert';

import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/reminder_id_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderDetailController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  var reminder = Rxn<ReminderIdModel>();
  final RxInt reminderId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getReminder();
    reminderId.value = Get.arguments;
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

    print("Reminder ID " + Get.arguments.toString());

    if (result.statusCode == 200) {
      print("das");
      reminder = ReminderIdModel.fromMap(jsonDecode(result.body))
          as Rxn<ReminderIdModel>;
      update();
      print("Data " + reminder.value!.data!.medicineName.toString());
    } else {
      print('Request failed with status: ${result.statusCode}');
    }
  }
}
