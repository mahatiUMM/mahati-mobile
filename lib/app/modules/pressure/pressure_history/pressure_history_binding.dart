import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/pressure/pressure_history/pressure_history_controller.dart';

class PressureHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PressureHistoryController());
  }
}
