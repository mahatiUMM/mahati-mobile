import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_add/reminder_add_controller.dart';

class ReminderAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReminderAddController());
  }
}
