import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_action/reminder_action_controller.dart';

class ReminderActionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReminderActionController());
  }
}
