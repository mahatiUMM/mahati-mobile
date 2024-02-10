import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_screen.dart';

class SplashController extends GetxController {
  String logo = "assets/svgs/mahati_logo.svg";

  @override
  void onInit() {
    super.onInit();
    _navigateToOnboardScreen();
  }

  _navigateToOnboardScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Get.off(() => OnboardingScreen());
  }
}
