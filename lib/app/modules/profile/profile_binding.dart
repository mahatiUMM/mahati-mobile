import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.lazyPut(() => ProfileController());
  }
}
