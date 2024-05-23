import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refiil/reminder_refill_controller.dart';
import 'package:mahati_mobile/app/utils/notification_service.dart';
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
          controller: controller.namaObatController,
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
          "Obat yang Sudah Diminum",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Resources.color.subtitleColor,
            fontSize: 11.sp,
            fontFamily: Resources.font.primaryFont,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          controller: controller.takenObatController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Resources.color.textFieldColor,
            hintText: "Masukkan obat yang sudah diminum",
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
          "Total Obat",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Resources.color.subtitleColor,
            fontSize: 11.sp,
            fontFamily: Resources.font.primaryFont,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          controller: controller.amountObatController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: Resources.color.textFieldColor,
            hintText: "Masukkan total obat",
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
          "Penyebab Sakit",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Resources.color.subtitleColor,
            fontSize: 11.sp,
            fontFamily: Resources.font.primaryFont,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          controller: controller.causeObatController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Resources.color.textFieldColor,
            hintText: "Masukkan penyebab sakit",
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
          "Ukuran Kapsul",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Resources.color.subtitleColor,
            fontSize: 11.sp,
            fontFamily: Resources.font.primaryFont,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          controller: controller.causeObatController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Resources.color.textFieldColor,
            hintText: "Masukkan ukuran kapsul",
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
          "Waktu Pengingat Obat",
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
              controller: controller.timeObatController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Resources.color.textFieldColor,
                hintText: controller.timeObatController.text.isEmpty
                    ? "Pilih waktu pengingat obat (per hari)"
                    : controller.timeObatController.text,
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
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Resources.color.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            // controller.postReminder(
            //   controller.namaObatController.text,
            //   controller.takenObatController.text,
            //   controller.totalObatController.text,
            //   controller.amountObatController.text,
            //   controller.causeObatController.text,
            //   controller.capSizeObatController.text,
            //   controller.timeObatController.text,
            // );
            NotificationService().scheduleNotification(
              title: "Reminder",
              body: "Jangan lupa minum obat",
              scheduledNotificationDateTime: DateTime.now().add(
                Duration(seconds: 5),
              ),
            );
          },
          child: Text(
            "Simpan",
            style: TextStyle(
              color: Resources.color.whiteColor,
              fontSize: 11.sp,
              fontFamily: Resources.font.primaryFont,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}
