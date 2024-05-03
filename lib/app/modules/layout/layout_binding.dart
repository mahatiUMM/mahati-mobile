import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/home/home_controller.dart';
import 'package:mahati_mobile/app/modules/inbox/inbox_controller.dart';
import 'package:mahati_mobile/app/modules/layout/layout_controller.dart';
import 'package:mahati_mobile/app/modules/profile/profile_controller.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LayoutController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => InboxController());
    Get.lazyPut(() => ReminderController());
  }
}
