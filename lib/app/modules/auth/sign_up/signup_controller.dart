import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/SignUp.model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';

class SignUpController extends GetxController {
  late RestClient restClient;
  final signUp = <SignUpModel>[].obs;
  var isToLoadMore = true;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    restClient = Get.put(RestClient());
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  sendData({
    required String username,
    required String email,
    required String password,
    required String number,
  }) async {
    try {
      isToLoadMore = true;
      update();

      if (username.isEmpty || email.isEmpty || password.isEmpty) {
        isToLoadMore = false;
        Get.showSnackbar(
          const GetSnackBar(
            message: "Please fill in all required fields.",
            duration: Duration(milliseconds: 3000),
          ),
        );
        return;
      }

      if (!GetUtils.isEmail(email)) {
        isToLoadMore = false;
        Get.showSnackbar(
          const GetSnackBar(
            message: "Please enter a valid email address.",
            duration: Duration(milliseconds: 3000),
          ),
        );
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

      if (result.statusCode == 200 || result.statusCode == 201) {
        var responseData = SignUpModel.fromJson(jsonDecode(result.body));
        signUp.add(responseData);
        Get.offAllNamed('/login');

        Get.showSnackbar(
          const GetSnackBar(
            message: "Registration successful. Redirecting to login...",
            duration: Duration(milliseconds: 3000),
          ),
        );
      } else {
        isToLoadMore = false;
        print("Registration failed. Response content: ${result.body}");
        Get.showSnackbar(
          const GetSnackBar(
            message: "Registration failed. Please try again.",
            duration: Duration(milliseconds: 3000),
          ),
        );
      }
    } on SocketException catch (_) {
      handleException("No Internet Connection");
    } on FormatException catch (_) {
      handleException("Bad Response Format!");
    } catch (e) {
      handleException("Something Went Wrong");
    }
  }
}

void handleException(String errorMessage) {
  Get.showSnackbar(
    GetSnackBar(
      message: errorMessage,
      duration: const Duration(milliseconds: 3000),
    ),
  );
}
