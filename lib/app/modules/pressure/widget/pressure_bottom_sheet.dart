import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget pressureBottomSheet({
  required String systolic,
  required String diastolic,
  required String pulse,
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
            color: Colors.green,
            shadows: [
              BoxShadow(
                color: Colors.green.withOpacity(0.2), // Shadow color
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
                child: Text("Selamat Tekanan Darah Anda Normal",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontFamily: Resources.font.primaryFont,
                      fontWeight: FontWeight.w700,
                    )),
              ),
              ElevatedButton(
                  onPressed: () => Get.offAndToNamed('/pressure/history'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text(
                    "Lihat Riwayat Tekanan Darah",
                    style:
                        TextStyle(color: Colors.green.shade800, fontSize: 12),
                  )),
            ],
          ),
        ),
      ],
    ),
  );
}
