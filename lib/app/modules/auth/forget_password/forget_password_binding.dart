import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/auth/forget_password/forget_password_controller.dart';
import 'package:mahati_mobile/app/modules/auth/sign_up/signup_controller.dart';
import 'package:mahati_mobile/app/modules/auth/vertification_otp/verification_email_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
    Get.lazyPut(() => VerificationEmailController());
    Get.lazyPut(() => SignUpController());
  }
  
}