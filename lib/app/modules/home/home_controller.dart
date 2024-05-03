import 'dart:convert';

import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/core/data/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var tabIndex = 0;
  var username = Rx<String>('');

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> getUserProfile() async {
    final token = await getToken();
    final restClient = Get.find<RestClient>();
    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.GET, null, token.toString());
    var responseData = UserModel.fromJson(jsonDecode(result.body));
    username.value = responseData.username;
  }
}
