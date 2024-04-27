import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/education_controller.dart';

class EducationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EducationController());
  }
}
