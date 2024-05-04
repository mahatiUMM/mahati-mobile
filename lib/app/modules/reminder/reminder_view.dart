import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_controller.dart';
import 'package:mahati_mobile/app/modules/reminder/widget/reminder_card.dart';
import 'package:mahati_mobile/app/modules/reminder/widget/reminder_date.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ReminderView extends GetView<ReminderController> {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Kembali',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pengingat",
                  style: TextStyle(
                    color: Resources.color.baseColor,
                    fontSize: 20,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
                reminderDate(),
                SizedBox(
                  height: null,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          print("Card $index clicked");
                        },
                        child: reminderCard(
                          title: controller.title,
                          status: controller.status,
                          strong: controller.strong,
                          time: controller.time,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Resources.color.whiteColor,
        tooltip: 'Increment',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          print("Add reminder clicked");
        },
        child: Icon(Icons.add, color: Resources.color.baseColor, size: 28),
      ),
    );
  }
}
