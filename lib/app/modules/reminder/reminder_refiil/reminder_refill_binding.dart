import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refiil/reminder_refill_controller.dart';

class ReminderRefillBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => ReminderRefillController());
  }
}
