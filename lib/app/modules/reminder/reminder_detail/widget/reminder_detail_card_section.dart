import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_detail/reminder_detail_controller.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_detail/widget/reminder_detail_card_info.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget buildCardSection() {
  final ReminderDetailController controller = Get.find();
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildInfoCard(
            title: "Jadwal",
            value: Obx(
              () => Text(
                controller.reminderModel.value?.data.medicineTime.toString() ??
                    "Loading...",
                style: TextStyle(
                  color: Resources.color.secondaryColor1,
                  fontSize: 12,
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
          buildInfoCard(
            title: "Kekuatan",
            value: Obx(
              () => Text(
                controller.capSizeToString(
                    controller.reminderModel.value?.data.capSize ?? 0),
                style: TextStyle(
                  color: Resources.color.tertiaryColor1,
                  fontSize: 12,
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildInfoCard(
            title: "Sudah Diminum",
            value: Obx(
              () => Text(
                controller.reminderModel.value?.data.medicineTaken.toString() ??
                    "Loading...",
                style: TextStyle(
                  color: Resources.color.orangeColor,
                  fontSize: 12,
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
          buildInfoCard(
            title: "Total",
            value: Obx(
              () => Text(
                controller.reminderModel.value?.data.amount.toString() ??
                    "Loading...",
                style: TextStyle(
                  color: Resources.color.primaryColor,
                  fontSize: 12,
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildInfoCard(
            title: "Penyebab",
            value: Obx(
              () => Text(
                controller.reminderModel.value?.data.cause ?? "Loading...",
                style: TextStyle(
                  color: Resources.color.primaryColor,
                  fontSize: 12,
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
          buildInfoCard(
            title: "Dibuat Tanggal",
            value: Obx(
              () => Text(
                controller.reminderModel.value?.data.createdAt
                        .toIso8601String() ??
                    "Loading...",
                style: TextStyle(
                  color: Resources.color.orangeColor1,
                  fontSize: 12,
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
