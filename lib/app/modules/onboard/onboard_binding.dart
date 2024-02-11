import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_controller.dart';

class OnboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnBoardController());
  }
}
