import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

void reminderFilter() {
  final controller = Get.find<ReminderController>();

  Get.bottomSheet(
    Container(
      height: 420,
      width: Get.width,
      decoration: BoxDecoration(
        color: Resources.color.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close)),
                Text(
                  "Filter Reminder",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w600,
                    color: Resources.color.baseColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.exportUserReminder();
                  },
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Resources.color.baseColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "Export",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Nama Obat',
                  style: TextStyle(
                    fontSize: 16,
                    color: Resources.color.baseColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan nama obat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Tipe Obat',
                  style: TextStyle(
                    fontSize: 16,
                    color: Resources.color.baseColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan tipe obat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Jadwal Obat',
                  style: TextStyle(
                    fontSize: 16,
                    color: Resources.color.baseColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukkan jadwal obat',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("Reset clicked");
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Resources.color.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Resources.color.baseColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Reset",
                          style: TextStyle(
                            color: Resources.color.baseColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("Apply Filter clicked");
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Resources.color.baseColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Apply Filter",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
