import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  String logo = "assets/svgs/mahati_logo.svg";

  @override
  void onInit() {
    super.onInit();
    _navigateToOnboardScreen();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  _navigateToOnboardScreen() async {
    final token = await getToken();

    await Future.delayed(const Duration(seconds: 3));
    if (token != null) {
      Get.offAndToNamed('/layout');
    } else {
      Get.off(() => const OnboardView());
    }
  }
}
