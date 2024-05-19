import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_controller.dart';
import 'package:mahati_mobile/app/modules/reminder/widget/reminder_card.dart';
import 'package:mahati_mobile/app/modules/reminder/widget/reminder_date.dart';
import 'package:mahati_mobile/app/modules/reminder/widget/reminder_filter.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:intl/intl.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Kembali',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.filter_alt_outlined),
              onPressed: () {
                print("Filter clicked");
                reminderFilter();
              },
            ),
          ],
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
                Obx(
                  () => SizedBox(
                    height: null,
                    child: controller.reminderList.isEmpty
                        ? const Center(
                            child: Text('Data is empty'),
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.reminderList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  print(controller.reminderList[index].id);
                                  Get.toNamed('/reminder/detail');
                                },
                                child: reminderCard(
                                  title: controller
                                      .reminderList[index].medicineName,
                                  status: controller.checkStatus(controller
                                      .reminderList[index].medicineTaken),
                                  strong: controller.capSizeToString(
                                      controller.reminderList[index].capSize),
                                  time: DateFormat('HH:mm', 'id_ID').format(
                                      controller.reminderList[index].createdAt
                                          .toLocal()),
                                ),
                              );
                            },
                          ),
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
          Get.toNamed('/reminder/refill');
        },
        child: Icon(Icons.add, color: Resources.color.baseColor, size: 28),
      ),
    );
  }
}
