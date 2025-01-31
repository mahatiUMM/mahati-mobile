import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/forget_password_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/routes/app_pages.dart';
import 'package:mahati_mobile/app/utils/show_bar/show_bar.dart';

class ForgetPasswordController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();

  late final GlobalKey<FormState> newPasswordFormKey;
  late final GlobalKey<FormState> emailFormKey;
  late final FocusNode emailFocusNode;
  late final FocusNode newPasswordFocusNode;
  late final FocusNode confirmPasswordFocusNode;

  RxString emailID = ''.obs;
  RxString newPassword = ''.obs;
  RxString newPasswordErrorMessage = ''.obs;
  RxString confirmPassword = ''.obs;
  RxString confirmPasswordErrorMessage = ''.obs;
  RxBool showNewPassword = true.obs;
  RxBool showConfirmPassword = true.obs;
  RxBool isEmailError = true.obs;
  RxBool isNewPasswordError = false.obs;
  RxBool isConfirmPasswordError = false.obs;

  TextEditingController emailOTPController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    newPasswordFormKey = GlobalKey<FormState>();
    emailFormKey = GlobalKey<FormState>();
    emailFocusNode = FocusNode();
    newPasswordFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
    super.onInit();
  }

  @override
  void dispose() {
    emailOTPController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    emailFocusNode.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void toggleObscureTextNewPassword() {
    showNewPassword.value = !showNewPassword.value;
  }

  void toggleObscureTextConfirmPassword() {
    showConfirmPassword.value = !showConfirmPassword.value;
  }

  updatePassword() async {
    try {
      update();

      if (newPassword.isEmpty || confirmPassword.isEmpty) {
        showErrorMessage("Password tidak boleh kosong");
      } else if (newPassword.value.length < 8 ||
          confirmPassword.value.length < 8) {
        showErrorMessage("Password harus lebih dari 8 karakter");
      } else if (newPassword.value != confirmPassword.value) {
        showErrorMessage("Password tidak sama");
      }

      ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel(
          email: emailID.value, password: confirmPassword.value);
      final result = await restClient.request(
          '/forget_password', HttpMethod.PUT, forgetPasswordModel.toJson());
      debugPrint("Response Data : ${result.statusCode}");

      if (result.statusCode == 200) {
        Get.offAllNamed(Routes.signin );
        showSuccessMessage(
            "Authentication success", "Berhasil mengubah password");
      } else {
        showErrorMessage(json.decode(result.body)["message"]);
      }
    } catch (e) {
      // ignore: avoid_print
      print("uknow error: $e");
    }
  }
}
