import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/profile_model.dart';
import 'package:mahati_mobile/app/core/data/signin_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/show_bar/show_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  late RestClient restClient;
  final signIn = <SignInModel>[].obs;
  RxBool showPassword = true.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    restClient = Get.put(RestClient());
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void toggleObscureText() {
    showPassword.value = !showPassword.value;
    print("After toggle: ${showPassword.value}");
  }

  Future<void> saveUserData(String token, String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
    await prefs.setString('userId', userId);
  }

  loginAccount({required String email, required String password}) async {
    try {
      update();

      if (email.isEmpty || password.isEmpty) {
        showErrorMessage("Please fill all the fields");
      }

      if (!GetUtils.isEmail(email)) {
        showErrorMessage("Please enter a valid email address");
      }

      SignInModel signInModel = SignInModel(email: email, password: password);

      final result = await restClient.request(
          "/signin", HttpMethod.POST, signInModel.toJson());

      print(result.body);
      var responseData = jsonDecode(result.body);

      if (responseData["status"] == 200) {
        var token = responseData["access_token"];
        final profileData = await restClient.requestWithToken(
            "/profile", HttpMethod.GET, null, token.toString());
        var profile = UserModel.fromJson(jsonDecode(profileData.body));

        await saveUserData(token, profile.id);
        Get.offAllNamed("/layout");

        var response = SignInModel.fromJson(jsonDecode(result.body));
        signIn.add(response);
        showSuccessMessage(
            "Registration successful", "Redirecting to home page");
      } else {
        showErrorMessage(responseData["message"]);
      }
    } catch (e) {
      print(e);
    }
  }
}
