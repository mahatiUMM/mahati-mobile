import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_edit/reminder_edit_controller.dart';

class ReminderEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReminderEditController());
  }
}
