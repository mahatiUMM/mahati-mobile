import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/inbox/inbox_controller.dart';

class InboxBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InboxController());
  }
}
