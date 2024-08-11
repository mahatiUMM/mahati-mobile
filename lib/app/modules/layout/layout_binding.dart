import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/education_controller.dart';
import 'package:mahati_mobile/app/modules/home/home_controller.dart';
import 'package:mahati_mobile/app/modules/inbox/inbox_controller.dart';
import 'package:mahati_mobile/app/modules/layout/layout_controller.dart';
import 'package:mahati_mobile/app/modules/profile/profile_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LayoutController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => EducationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => InboxController());
  }
}
