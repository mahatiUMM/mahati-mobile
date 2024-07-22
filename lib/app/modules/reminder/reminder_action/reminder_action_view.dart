import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_action/reminder_action_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ReminderActionView extends GetView<ReminderActionController> {
  const ReminderActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Container(
              height: Get.height,
              decoration: BoxDecoration(color: Resources.color.primaryColor),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Resources.color.whiteColor),
                ),
              ),
            );
          } else {
            return Container(
              width: Get.width,
              height: Get.height,
              decoration: BoxDecoration(color: Resources.color.primaryColor),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    controller.reminderName.value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () => print("Tidak Minum"),
                          child: const Text(
                            "Tidak Minum",
                            style: TextStyle(fontSize: 18),
                          )),
                      ElevatedButton(
                          onPressed: () => controller.postAcceptReminder(),
                          child: const Text(
                            "Minum Obat",
                            style: TextStyle(fontSize: 18),
                          ))
                    ],
                  )
                ],
              )),
            );
          }
        }),
      ),
    );
  }
}
