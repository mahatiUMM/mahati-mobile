import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/constants/text_strings.dart';
import 'package:mahati_mobile/app/constants/text_style.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

import '../forget_password_controller.dart';

class ConfirmPasswordForm extends StatelessWidget {
  const ConfirmPasswordForm({
    super.key,
    required this.controller,
  });

  final ForgetPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: Get.height * 0.08,
        width: Get.width,
        child: TextField(
          onTap: () => controller.confirmPasswordFocusNode.requestFocus(),
          onEditingComplete: () {
            controller.confirmPasswordFocusNode.unfocus();
            controller.confirmPassword.value =
                controller.confirmPasswordController.text;
            if (controller.confirmPassword.isEmpty) {
              controller.isConfirmPasswordError.value = true;
              controller.confirmPasswordErrorMessage.value =
                  "Harap konfirmasi password";
            } else if (controller.confirmPassword.value.length < 8) {
              controller.isConfirmPasswordError.value = true;
              controller.confirmPasswordErrorMessage.value =
                  "Password harus lebih dari 8 karakter";
            } else if (controller.confirmPassword.value ==
                controller.newPassword.value) {
              controller.isConfirmPasswordError.value = false;
              debugPrint("Password sama");
            } else {
              controller.isConfirmPasswordError.value = true;
              controller.confirmPasswordErrorMessage.value =
                  "Password Tidak Sama";
              debugPrint("password tidak sama");
            }
          },
          onChanged: (value) {
            if (value.isEmpty) {
              controller.isConfirmPasswordError.value = false;
            } else if (value.length < 8) {
              controller.isConfirmPasswordError.value = true;
              controller.confirmPasswordErrorMessage.value =
                  "Password harus lebih dari 8 karakter";
            }else if(value != controller.newPassword.value){
              controller.isConfirmPasswordError.value = true;
              controller.confirmPasswordErrorMessage.value =
                  "Password Tidak Sama";
            } 
            else {
              debugPrint("Kebobolan");
              controller.isConfirmPasswordError.value = false;
            }
          },
          focusNode: controller.confirmPasswordFocusNode,
          controller: controller.confirmPasswordController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: controller.showConfirmPassword.value,
          decoration: InputDecoration(
            errorText: controller.isConfirmPasswordError.isTrue
                ? controller.confirmPasswordErrorMessage.value
                : null,
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Resources.color.secondaryColor2)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            filled: true,
            fillColor: Resources.color.textFieldColor,
            hintText: TextStrings.authSubtitle2,
            hintStyle: StyleText.signInField,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Resources.color.textFieldColor),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Resources.color.textFieldColor),
                borderRadius: BorderRadius.circular(15)),
            suffixIcon: IconButton(
              icon: Icon(
                controller.showConfirmPassword.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.black54,
              ),
              onPressed: () {
                controller.toggleObscureTextConfirmPassword();
              },
            ),
          ),
        ),
      ),
    );
  }
}
