import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('authToken');
    Get.offAllNamed('/signin');

    Get.snackbar(
      'Berhasil',
      'Berhasil keluar dari aplikasi',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
