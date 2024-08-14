import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget pressureBottomSheet({
  required String systolic,
  required String diastolic,
  required String pulse,
  required bool
      isNormal, // New parameter to indicate if the pressure is normal or not
}) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: ShapeDecoration(
            color: isNormal
                ? Colors.green
                : Colors.red, // Change color based on normal or abnormal
            shadows: [
              BoxShadow(
                color: (isNormal ? Colors.green : Colors.red)
                    .withOpacity(0.2), // Shadow color
                spreadRadius: 8,
                blurRadius: 12,
                offset: const Offset(0, 3),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  isNormal
                      ? "Selamat Tekanan Darah Anda Normal"
                      : "Perhatian! Tekanan Darah Anda Tidak Normal", // Different text for abnormal pressure
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => Get.offAndToNamed('/pressure/history'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  "Lihat Riwayat Tekanan Darah",
                  style: TextStyle(
                    color: isNormal
                        ? Colors.green.shade800
                        : Colors.red.shade800, // Text color changes
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
