import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/notification_service.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ReminderRefillController extends GetxController {
  final TextEditingController namaObatController = TextEditingController();
  final TextEditingController takenObatController = TextEditingController();
  final TextEditingController totalObatController = TextEditingController();
  final TextEditingController amountObatController = TextEditingController();
  final TextEditingController causeObatController = TextEditingController();
  final TextEditingController capSizeObatController = TextEditingController();
  final TextEditingController dateObatController = TextEditingController();
  final TextEditingController timeObatController = TextEditingController();

  final RestClient restClient = Get.find<RestClient>();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void onInit() {
    super.onInit();
    getUserId();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateObatController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      print(selectedDate);
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      selectedTime = picked;
      final now = DateTime.now();
      final selectedDateTime = DateTime(
          now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
      timeObatController.text = DateFormat('HH:mm').format(selectedDateTime);
      print(timeObatController.text);
    }
  }

  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return int.parse(prefs.getString('userId')!);
  }

  Future<void> postReminder(
    String medicineName,
    String medicineTaken,
    String? medicineTotal,
    String amount,
    String cause,
    String capSize,
    String medicineTime,
  ) async {
    final userId = await getUserId();

    final reminderPostData = {
      "user_id": userId,
      "medicine_name": medicineName,
      "medicine_taken": medicineTaken,
      "medicine_total": medicineTotal,
      "amount": amount,
      "cause": cause,
      "cap_size": capSize,
      "medicine_time": medicineTime,
    };

    print(DateTime.now().add(
      Duration(seconds: 5),
    ));

    NotificationService().scheduleNotification(
      title: "Reminder",
      body: "Jangan lupa minum obat",
      scheduledNotificationDateTime: DateTime.now().add(
        Duration(seconds: 5),
      ),
    );

    if (userId == null ||
        medicineName == "" ||
        medicineTaken == null ||
        medicineTotal == null ||
        amount == null ||
        cause == "" ||
        cause == "" ||
        capSize == null ||
        medicineTime == "") {
      Get.snackbar(
        'Gagal menambahkan pengingat obat',
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
    } else {
      try {
        final result = await restClient.request(
            "/reminder", HttpMethod.POST, reminderPostData);
        print(result.body);

        if (result.statusCode == 200) {
          // NotificationService().scheduleNotification(scheduledNotificationDateTime: );
          Get.snackbar(
            'Success',
            'Reminder added successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Resources.color.textFieldColor,
            colorText: Resources.color.baseColor,
            leftBarIndicatorColor: Resources.color.primaryColor1,
            overlayColor: Resources.color.primaryColor,
            progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(
              Resources.color.secondaryColor,
            ),
            animationDuration: const Duration(milliseconds: 500),
            icon:
                Icon(Icons.check, color: Resources.color.baseColor, size: 20.0),
          );
        } else {
          Get.snackbar(
            'Gagal menambahkan pengingat obat',
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
            icon:
                Icon(Icons.error, color: Resources.color.baseColor, size: 20.0),
          );
        }
      } catch (e) {
        Get.snackbar(
          'Gagal menambahkan pengingat obat',
          e.toString(),
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
      }
    }
  }
}
