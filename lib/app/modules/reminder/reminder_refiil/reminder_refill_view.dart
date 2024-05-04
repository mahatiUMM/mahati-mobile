import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refiil/reminder_refill_controller.dart';

class ReminderRefillView extends GetView<ReminderRefillController> {
  const ReminderRefillView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Reminder Refill View"),
      ),
    );
  }
}
