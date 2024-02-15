import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/auth/sign_in/signin_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
  }
}
