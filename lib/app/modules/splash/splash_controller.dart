import 'dart:convert';

import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_view.dart';
import 'package:mahati_mobile/app/utils/show_bar/show_bar.dart';
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
    final restClient = Get.find<RestClient>();
    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.GET, null, token.toString());
    Map<String, dynamic> resultData = json.decode(result.body);

    await Future.delayed(const Duration(seconds: 3));
    if (token != null) {
      if (resultData['status'] == 401) {
        showErrorMessage('Token Expired. Please login again');
        Get.off(() => const OnboardView());
      } else if (resultData['status'] == 404) {
        showErrorMessage('User not found. Please login again');
        Get.off(() => const OnboardView());
      } else if (resultData['status'] == 200) {
        Get.offAndToNamed('/layout');
      }
    } else {
      Get.off(() => const OnboardView());
    }
  }
}
