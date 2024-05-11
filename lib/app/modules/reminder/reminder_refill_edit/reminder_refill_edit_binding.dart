import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refill_edit/reminder_refill_edit_controller.dart';

class ReminderRefillEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReminderRefillEditController());
  }
}
