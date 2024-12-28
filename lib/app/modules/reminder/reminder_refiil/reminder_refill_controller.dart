import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahati_mobile/app/core/data/reminder_action_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/notification_service.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:mahati_mobile/app/utils/token_utils.dart';

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

  final token = getToken();

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

    var amountInt = int.tryParse(amount) ?? 0;
    var medicineTakenInt = int.tryParse(medicineTaken) ?? 0;

    print("medicineTakenInt: $medicineTakenInt");
    print("amountInt: $amountInt");

    // check if amount and medicine taken is not a number
    if (amount.isNumericOnly == false || medicineTaken.isNumericOnly == false) {
      Get.snackbar(
        'Gagal menambahkan pengingat obat',
        'Jumlah obat harus berupa angka, bukan huruf, angka negatif atau simbol',
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

    // check if the medicine taken is more than the amount
    if (medicineTakenInt > amountInt) {
      Get.snackbar(
        'Gagal menambahkan pengingat obat',
        'Jumlah obat yang diminum tidak boleh lebih dari jumlah obat',
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

    // check if the medicine taken is 0
    if (amountInt == 0) {
      Get.snackbar(
        'Gagal menambahkan pengingat obat',
        'Total obat tidak boleh 0',
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

    // total dari obat yang sudah diminum dan total obat yang diberi
    final medicineTotal = amountInt - medicineTakenInt;

    final DateTime now = DateTime.now();
    DateTime scheduledNotificationDateTime =
        DateFormat('HH:mm').parse(medicineTime);
    scheduledNotificationDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      scheduledNotificationDateTime.hour,
      scheduledNotificationDateTime.minute,
    );

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

    try {
      final result = await restClient.request(
          "/reminder", HttpMethod.POST, reminderPostData);

      if (result.statusCode == 201) {
        final responseData = ReminderAction.fromRawJson(result.body);

        // If the scheduled time is in the past, add one day to it
        if (scheduledNotificationDateTime.isBefore(now)) {
          scheduledNotificationDateTime =
              scheduledNotificationDateTime.add(const Duration(days: 1));
        }

        NotificationService().scheduleDailyNotifications(
          id: responseData.data.id,
          title: "Pengingat Obat",
          body: "Jangan lupa minum ${medicineName.toString()}",
          payload: result.body,
          scheduledNotificationDateTime: scheduledNotificationDateTime,
          numberOfDays: medicineTotal,
        );

        Get.offAllNamed("/layout");

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
        print(result.body);
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
