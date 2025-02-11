import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/profile_model.dart';
import 'package:mahati_mobile/app/core/data/signin_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/show_bar/show_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  final signIn = <SignInModel>[].obs;
  RxBool showPassword = true.obs;
  RxBool isFieldValid = false.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void toggleObscureText() {
    showPassword.value = !showPassword.value;
  }

  void validateEmailAndPassField() {
    isFieldValid.value =
        (emailController.text.isEmpty || !emailController.text.isEmail) ||
                passwordController.text.isEmpty ||
                passwordController.text.length < 8
            ? false
            : true;
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
      // ignore: avoid_print
      print(e);
    }
  }
}
