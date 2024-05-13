import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/signup_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/show_bar/show_bar.dart';

class SignUpController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  final signUp = <SignUpModel>[].obs;
  RxBool showPassword = true.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void toggleObscureText() {
    showPassword.value = !showPassword.value;
    print("After toggle: ${showPassword.value}");
  }

  registerAccount({
    required String username,
    required String email,
    required String password,
    required String number,
  }) async {
    try {
      update();

      if (username.isEmpty || email.isEmpty || password.isEmpty) {
        showErrorMessage('Please fill all the fields.');
        return;
      }

      if (!GetUtils.isEmail(email)) {
        showErrorMessage('Please enter a valid email address');
        return;
      }

      SignUpModel signUpModel = SignUpModel(
        username: username,
        email: email,
        password: password,
        number: number,
        photo: "",
      );

      final result = await restClient.request(
        "/signup",
        HttpMethod.POST,
        signUpModel.toJson(),
      );

      print(result.body);
      var responseData = jsonDecode(result.body);

      if (responseData["success"] == true) {
        Get.offAllNamed('/signin');
        var responseData = SignUpModel.fromJson(jsonDecode(result.body));
        signUp.add(responseData);
        showSuccessMessage(
            'Registration successful', 'Redirecting to login...');
      } else {
        showErrorMessage(responseData["message"]);
      }
    } on SocketException catch (_) {
      showErrorMessage('No Internet Connection');
    } on FormatException catch (_) {
      showErrorMessage('Bad Response Format!');
    } catch (e) {
      /*
        ERROR: Data Type Is NULL but the body is STRING
      */
      print(e);
      showErrorMessage('Registration failed. $e');
    }
  }
}
