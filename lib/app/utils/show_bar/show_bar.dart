import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorMessage(String message) {
  Get.snackbar(
    'Authentication failed',
    message,
    messageText: Text(
      message,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
    ),
    duration: const Duration(seconds: 3),
    colorText: Colors.black,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.white,
    forwardAnimationCurve: Curves.easeIn,
    reverseAnimationCurve: Curves.easeOut,
  );
}

void showSuccessMessage(String title, String message) {
  Get.snackbar(
    title,
    message,
    messageText: Text(
      message,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
      ),
    ),
    duration: const Duration(seconds: 3),
    colorText: Colors.black,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.white,
    forwardAnimationCurve: Curves.easeIn,
    reverseAnimationCurve: Curves.easeOut,
  );
}
