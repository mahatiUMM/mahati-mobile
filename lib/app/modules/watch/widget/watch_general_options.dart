import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/watch/watch_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget watchGeneralSettings() {
  final watchController = Get.find<WatchController>();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Text(
          "Pengaturan Umum",
          style: TextStyle(
            color: Resources.color.baseColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: Resources.font.primaryFont,
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Resources.color.whiteColor,
            elevation: 0,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                color: Resources.color.baseColor,
              ),
              const SizedBox(width: 10),
              Text(
                'Perbarui',
                style: TextStyle(
                  color: Resources.color.baseColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Resources.color.whiteColor,
            elevation: 0,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Resources.color.baseColor,
              ),
              const SizedBox(width: 10),
              Text(
                'Tentang Perangkat',
                style: TextStyle(
                  color: Resources.color.baseColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () async {
            watchController.removeDevice();
            watchController.getWatchData();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Resources.color.primaryColor,
            elevation: 0,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Lepaskan perangkat',
                style: TextStyle(
                  color: Resources.color.whiteColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
