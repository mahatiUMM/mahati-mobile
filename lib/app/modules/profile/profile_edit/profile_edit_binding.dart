import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/profile/profile_edit/profile_edit_controller.dart';

class ProfileEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileEditController());
  }
}
