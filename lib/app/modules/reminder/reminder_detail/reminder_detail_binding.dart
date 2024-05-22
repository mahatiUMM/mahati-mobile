import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_detail/reminder_detail_controller.dart';

class ReminderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReminderDetailController());
  }
}
