import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refiil/reminder_refill_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget reminderRefillForm() {
  final ReminderRefillController controller = ReminderRefillController();
  return Card(
    elevation: 0,
    color: Resources.color.whiteColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nama Obat",
          style: TextStyle(
            color: Resources.color.baseColor,
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
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Resources.color.textFieldColor),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Status",
          style: TextStyle(
            color: Resources.color.baseColor,
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
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Resources.color.textFieldColor),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Waktu",
          style: TextStyle(
            color: Resources.color.baseColor,
          ),
        ),
      ],
    ),
  );
}
