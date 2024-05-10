import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/profile_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditController extends GetxController {
  Rx<File?> image = Rx<File?>(null);
  var username = Rx<String>('');
  var email = Rx<String>('');
  var password = Rx<String>('');
  var number = Rx<String>('');

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> getProfileData() async {
    final token = await getToken();
    final restClient = Get.find<RestClient>();

    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.GET, null, token.toString());

    var responseData = UserModel.fromJson(jsonDecode(result.body));

    username.value = responseData.username;
    email.value = responseData.email;
    password.value = responseData.password;
    number.value = responseData.number;
  }

  // working on this
  Future<void> updateProfile(
      String name, String email, String password, String number) async {
    final token = await getToken();
    final restClient = Get.find<RestClient>();

    final data = {
      "username": name,
      "email": email,
      "password": password,
      "number": number,
    };

    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.PUT, data, token.toString());

    print(result.body);
  }
}
