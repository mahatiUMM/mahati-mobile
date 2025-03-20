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
  RxBool isFieldValid = false.obs;
  RxBool isUsernameInvalid = false.obs;
  RxBool isEmailInvalid = false.obs;
  RxBool isPhoneNumberInvalid = false.obs;
  RxBool isPasswordInvalid = false.obs;
  RxString errorUsernameMessage = "".obs;
  RxString errorEmailMessage = "".obs;
  RxString errorPhoneMessage = "".obs;
  RxString errorPasswordMessage = "".obs;
  RxString usernameInput = "".obs;
  RxString emailInput = "".obs;
  RxString phoneNumberInput = "".obs;
  RxString passwordInput = "".obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void toggleObscureText() {
    showPassword.value = !showPassword.value;
  }

  void validateUsername() {
    if (usernameController.text.isEmpty) {
      isUsernameInvalid.value = true;
      errorUsernameMessage.value = "Harap masukkan nama pengguna";
      usernameInput.value = '';
    } else {
      isUsernameInvalid.value = false;
      usernameInput.value = usernameController.text;
    }
  }

  void validateEmail() {
    if (emailController.text.isEmpty) {
      isEmailInvalid.value = true;
      errorEmailMessage.value = "Harap masukkan email";
      emailInput.value = '';
    } else if (!emailController.text.isEmail) {
      isEmailInvalid.value = true;
      errorEmailMessage.value = "Masukkan email yang valid";
      emailInput.value = '';
    } else {
      isEmailInvalid.value = false;
      emailInput.value = emailController.text;
    }
  }

  void validatePhoneNumber() {
    if (phoneController.text.isEmpty) {
      isPhoneNumberInvalid.value = true;
      errorPhoneMessage.value = "Harap masukkan nomor telpon";
      phoneNumberInput.value = '';
    } else if (!RegExp(r"^(?:\+62|62|0)8[1-9][0-9]{6,10}$")
        .hasMatch(phoneController.text)) {
      isPhoneNumberInvalid.value = true;
      errorPhoneMessage.value = "Masukkan nomor telp yang benar";
      phoneNumberInput.value = '';
    } else {
      isPhoneNumberInvalid.value = false;
      phoneNumberInput.value = phoneController.text;
    }
  }

  void validatePassword() {
    if (passwordController.text.isEmpty) {
      isPasswordInvalid.value = true;
      errorPasswordMessage.value = "Harap masukkan password";
      passwordInput.value = '';
    } else if (passwordController.text.length < 8) {
      isPasswordInvalid.value = true;
      errorPasswordMessage.value = "Password harus lebih dari 8 karakter";
      passwordInput.value = '';
    } else {
      isPasswordInvalid.value = false;
      passwordInput.value = passwordController.text;
    }
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

      var responseData = jsonDecode(result.body);

      if (responseData["success"] == true) {
        Get.offAllNamed('/signin');
        showSuccessMessage('Authentication successful', 'Berhasil mendaftar');
        var responseData = SignUpModel.fromJson(jsonDecode(result.body));
        signUp.add(responseData);
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
      // ignore: avoid_print
      print(e);
    }
  }
}
