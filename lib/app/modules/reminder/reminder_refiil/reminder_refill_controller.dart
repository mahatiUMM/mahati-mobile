import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/notification_service.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderRefillController extends GetxController {
  final TextEditingController namaObatController = TextEditingController();
  final TextEditingController takenObatController = TextEditingController();
  final TextEditingController amountObatController = TextEditingController();
  final TextEditingController causeObatController = TextEditingController();
  final TextEditingController capSizeObatController = TextEditingController();
  final TextEditingController dateObatController = TextEditingController();
  final TextEditingController timeObatController = TextEditingController();

  final RestClient restClient = Get.find<RestClient>();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  String? selectedCapsuleSize;

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
    }
  }

  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return int.parse(prefs.getString('userId')!);
  }

  Future<void> postReminder(
    String medicineName,
    String? medicineTaken,
    String? amount,
    String cause,
    String capSize,
    String? medicineTime,
  ) async {
    final userId = await getUserId();

    if (medicineName.isEmpty ||
        amount == null ||
        medicineTaken == null ||
        cause.isEmpty ||
        capSize.isEmpty ||
        medicineTime == null) {
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
      return;
    }

    final amountInt = int.tryParse(amount) ?? 0;
    final medicineTakenInt = int.tryParse(medicineTaken) ?? 0;
    final medicineTotal = amountInt - medicineTakenInt;

    if (capSize == "Tidak Kuat") {
      capSize = "1";
    } else if (capSize == "Sedang") {
      capSize = "2";
    } else if (capSize == "Kuat") {
      capSize = "3";
    } else {
      capSize = "1";
    }

    final reminderPostData = {
      "user_id": userId,
      "medicine_name": medicineName,
      "medicine_taken": medicineTakenInt,
      "medicine_total": medicineTotal,
      "amount": amountInt,
      "cause": cause,
      "cap_size": int.parse(capSize),
      "medicine_time": medicineTime,
    };

    print('Reminder Post Data: $reminderPostData');

    try {
      final result = await restClient.request(
          "/reminder", HttpMethod.POST, reminderPostData);

      if (result.statusCode == 201) {
        // Parse the medicineTime into a DateTime object with today's date
        DateTime now = DateTime.now();
        DateTime scheduledNotificationDateTime =
            DateFormat('HH:mm').parse(medicineTime);
        scheduledNotificationDateTime = DateTime(
            now.year,
            now.month,
            now.day,
            scheduledNotificationDateTime.hour,
            scheduledNotificationDateTime.minute);

        // If the scheduled time is in the past, add one day to it
        if (scheduledNotificationDateTime.isBefore(now)) {
          scheduledNotificationDateTime =
              scheduledNotificationDateTime.add(const Duration(days: 1));
        }

        NotificationService().scheduleNotification(
          id: 6,
          title: "Reminder",
          body: "Jangan lupa minum obat",
          payLoad: "Test Payload",
          scheduledNotificationDateTime: scheduledNotificationDateTime,
        );

        Get.offAndToNamed('/layout');

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
          icon: Icon(Icons.check, color: Resources.color.baseColor, size: 20.0),
        );
      } else {
        Get.snackbar(
          'Gagal menambahkan pengingat obat',
          'Terjadi kesalahan saat mengirim data',
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
