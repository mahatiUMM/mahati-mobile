import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/auth/sign_up/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
