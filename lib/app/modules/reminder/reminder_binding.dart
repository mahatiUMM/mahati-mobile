import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_controller.dart';

class ReminderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReminderController());
  }
}
