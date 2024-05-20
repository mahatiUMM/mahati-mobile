import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refiil/reminder_refill_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

Widget reminderRefillForm(BuildContext context) {
  final ReminderRefillController controller = ReminderRefillController();
  return Card(
    elevation: 0,
    color: Resources.color.whiteColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          "Nama Obat",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Resources.color.subtitleColor,
            fontSize: 11.sp,
            fontFamily: Resources.font.primaryFont,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          controller: controller.titleController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Resources.color.textFieldColor,
            hintText: "Masukkan nama obat",
            hintStyle: TextStyle(
              color: Resources.color.hintColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Resources.color.textFieldColor),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Resources.color.textFieldColor),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "Status",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Resources.color.subtitleColor,
            fontSize: 11.sp,
            fontFamily: Resources.font.primaryFont,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          controller: controller.statusController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Resources.color.textFieldColor,
            hintText: "Masukkan status",
            hintStyle: TextStyle(
              color: Resources.color.hintColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Resources.color.textFieldColor),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Resources.color.textFieldColor),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "Tanggal",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Resources.color.subtitleColor,
            fontSize: 11.sp,
            fontFamily: Resources.font.primaryFont,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.selectDate(context);
          },
          child: AbsorbPointer(
            child: TextField(
              controller: controller.dateController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Resources.color.textFieldColor,
                hintText: controller.dateController.text.isEmpty
                    ? "Pilih tanggal"
                    : controller.dateController.text,
                hintStyle: TextStyle(
                  color: Resources.color.hintColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Resources.color.textFieldColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Resources.color.textFieldColor),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "Waktu",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Resources.color.subtitleColor,
            fontSize: 11.sp,
            fontFamily: Resources.font.primaryFont,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.selectTime(context);
          },
          child: AbsorbPointer(
            child: TextField(
              controller: controller.timeController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Resources.color.textFieldColor,
                hintText: controller.timeController.text.isEmpty
                    ? "Pilih waktu"
                    : controller.timeController.text,
                hintStyle: TextStyle(
                  color: Resources.color.hintColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Resources.color.textFieldColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Resources.color.textFieldColor),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
