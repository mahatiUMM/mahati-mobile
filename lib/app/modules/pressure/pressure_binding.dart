import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/pressure/pressure_controller.dart';

class PressureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PressureController());
  }
}
