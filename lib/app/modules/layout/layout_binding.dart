import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/layout/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LayoutController());
  }
}
