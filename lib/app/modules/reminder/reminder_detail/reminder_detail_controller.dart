import 'dart:convert';

import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/reminder_id_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderDetailController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  final RxInt reminderId = 0.obs;
  final RxInt medicineLeft = 0.obs;
  final Rx<ReminderIdModel?> reminderModel = Rx<ReminderIdModel?>(null);

  @override
  void onInit() {
    getReminder();
    reminderId.value = Get.arguments;
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

  String capSizeToString(int capSize) {
    switch (capSize) {
      case 1:
        return "Obat Terbatas";
      case 2:
        return "Obat Bebas Keras";
      case 3:
        return "Obat Keras";
      default:
        return 'Unknown';
    }
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

  Future<void> deleteReminder(int itemId) async {
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/reminder/$itemId", HttpMethod.DELETE, null, token.toString());

    if (result.statusCode == 200) {
      Get.snackbar(
        'Success',
        'Reminder deleted',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Resources.color.primaryColor,
        colorText: Resources.color.whiteColor,
      );
      Get.offAllNamed("/layout");
    } else {
      print('Request failed with status: ${result.statusCode}');
    }
  }
}
