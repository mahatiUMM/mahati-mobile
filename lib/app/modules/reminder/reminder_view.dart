import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_controller.dart';
import 'package:mahati_mobile/app/modules/reminder/widget/reminder_card.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:timezone/standalone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';
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
        backgroundColor: Resources.color.backgroundHome2,
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
            GestureDetector(
              onTap: () => Get.back(),
              child: Text(
                'Kembali',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: Resources.font.primaryFont,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.download_outlined),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Download Reminder'),
                      content: const Text(
                          'Apakah anda ingin mendownload pengingat obat anda?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Tidak'),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                            controller.exportUserReminder();
                          },
                          child: const Text('Ya'),
                        ),
                      ],
                    );
                  },
                );
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
              physics: const AlwaysScrollableScrollPhysics(),
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
                        EasyDateTimeLine(
                          initialDate:
                              DateTime.parse(controller.selectedDate.value),
                          onDateChange: (selectedDate) {
                            controller.selectedDate.value =
                                selectedDate.toString();
                          },
                          activeColor: Resources.color.primaryColor,
                          headerProps: const EasyHeaderProps(
                            dateFormatter: DateFormatter.monthOnly(),
                          ),
                          dayProps: const EasyDayProps(
                            height: 56.0,
                            width: 56.0,
                            dayStructure: DayStructure.dayNumDayStr,
                            inactiveDayStyle: DayStyle(
                              borderRadius: 48.0,
                              dayNumStyle: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            activeDayStyle: DayStyle(
                              dayNumStyle: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () {
                            final reminders = controller.reminderList;
                            return SizedBox(
                              height: null,
                              child: reminders.isEmpty
                                  ? const Center(
                                      child: Text('Search your reminder'),
                                    )
                                  : ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: reminders.length,
                                      itemBuilder: (context, index) {
                                        final reminder = reminders[index];

                                        final scheduleDate = tz.TZDateTime.from(
                                            reminder.createdAt,
                                            getLocation('Asia/Jakarta'));

                                        final DateTime selectedDate =
                                            DateFormat("yyyy-MM-dd HH:mm:ss")
                                                .parse(controller
                                                    .selectedDate.value);

                                        final DateTime reminderDate = DateTime(
                                            scheduleDate.year,
                                            scheduleDate.month,
                                            scheduleDate.day);

                                        if (selectedDate
                                                .isAfter(reminderDate) ||
                                            reminderDate.isAtSameMomentAs(
                                                selectedDate)) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                '/reminder/detail',
                                                arguments: {
                                                  "id": reminder.id,
                                                  "status":
                                                      controller.checkStatus(
                                                          reminder.schedules,
                                                          selectedDate),
                                                  "selectedDate": controller
                                                      .selectedDate.value
                                                },
                                              );
                                            },
                                            child: Column(
                                              children: [
                                                reminderCard(
                                                  title: reminder.medicineName,
                                                  status:
                                                      controller.checkStatus(
                                                          reminder.schedules,
                                                          selectedDate),
                                                  strong: controller
                                                      .capSizeToString(
                                                          reminder.capSize),
                                                  time: reminder.medicineTime,
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                            );
                          },
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
