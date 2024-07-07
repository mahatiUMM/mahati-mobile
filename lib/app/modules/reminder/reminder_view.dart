import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_controller.dart';
import 'package:mahati_mobile/app/modules/reminder/widget/reminder_card.dart';
import 'package:mahati_mobile/app/modules/reminder/widget/reminder_date.dart';
import 'package:mahati_mobile/app/modules/reminder/widget/reminder_filter.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ReminderView extends GetView<ReminderController> {
  const ReminderView({super.key});

  Future<void> _refreshReminders() async {
    await Get.find<ReminderController>().getReminder();
    Get.snackbar(
      'Berhasil mengambil data',
      'Data pengingat berhasil diperbarui',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Resources.color.textFieldColor,
      colorText: Resources.color.baseColor,
      leftBarIndicatorColor: Resources.color.primaryColor,
      overlayColor: Resources.color.primaryColor,
      progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(
        Resources.color.secondaryColor,
      ),
      animationDuration: const Duration(milliseconds: 500),
      icon: Icon(Icons.error, color: Resources.color.baseColor, size: 20.0),
    );
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Get.toNamed("/layout");
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
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
              child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Resources.color.primaryColor),
          ));
        } else {
          return RefreshIndicator(
            color: Resources.color.primaryColor,
            onRefresh: _refreshReminders,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.reminderList.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed(
                                            '/reminder/detail',
                                            arguments: controller
                                                .reminderList[index].id,
                                          );
                                        },
                                        child: reminderCard(
                                          title: controller
                                              .reminderList[index].medicineName,
                                          status: controller.checkStatus(
                                              controller.reminderList[index]
                                                  .medicineTaken),
                                          strong: controller.capSizeToString(
                                              controller
                                                  .reminderList[index].capSize),
                                          time: controller
                                              .reminderList[index].medicineTime,
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Resources.color.whiteColor,
        tooltip: 'Increment',
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          Get.toNamed('/reminder/refill');
        },
        child: Icon(Icons.add, color: Resources.color.baseColor, size: 28),
      ),
    );
  }
}
