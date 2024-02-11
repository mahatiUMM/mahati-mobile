import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_view.dart';

class SplashController extends GetxController {
  String logo = "assets/svgs/mahati_logo.svg";

  @override
  void onInit() {
    super.onInit();
    _navigateToOnboardScreen();
  }

  _navigateToOnboardScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => const OnboardView());
  }
}
