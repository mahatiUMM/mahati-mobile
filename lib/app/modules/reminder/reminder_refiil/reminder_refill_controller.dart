import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReminderRefillController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

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
      dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
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
      timeController.text = DateFormat('HH:mm').format(selectedDateTime);
      print(timeController.text);
    }
  }

  Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return int.parse(prefs.getString('userId')!);
  }

  Future<void> postReminder(
      String user_id,
      String medicine_name,
      String medicine_taken,
      String medicine_total,
      String amount,
      String cause,
      String cap_size) async {
    // Your code here
  }
}
