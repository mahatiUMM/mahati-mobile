import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/auth/sign_up/signup_controller.dart';
import 'package:mahati_mobile/app/modules/auth/vertification_otp/verification_email_controller.dart';

class VerificationEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VerificationEmailController());
    Get.put(SignUpController());
  }
  
}