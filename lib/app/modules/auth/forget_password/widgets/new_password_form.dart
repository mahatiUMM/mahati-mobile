import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/constants/text_strings.dart';
import 'package:mahati_mobile/app/constants/text_style.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

import '../forget_password_controller.dart';

class NewPasswordForm extends StatelessWidget {
  const NewPasswordForm({
    super.key,
    required this.controller,
  });

  final ForgetPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: controller.isNewPasswordError.isTrue
            ? Get.height * 0.09
            : Get.height * 0.05,
        width: Get.width,
        child: TextField(
          focusNode: controller.newPasswordFocusNode,
          onTap: () => controller.newPasswordFocusNode.requestFocus(),
          onEditingComplete: () {
            controller.newPasswordFocusNode.unfocus();
            controller.newPassword.value =
                controller.newPasswordController.text;
            if (controller.newPassword.value.isEmpty) {
              controller.isNewPasswordError.value = true;
              controller.newPasswordErrorMessage.value =
                  "Harap masukkan pasword baru";
            } else if (controller.newPassword.value.length < 8) {
              controller.isNewPasswordError.value = true;
              controller.newPasswordErrorMessage.value =
                  "Password harus lebih dari 8 karakter";
            } else {
              controller.isNewPasswordError.value = false;
            }
          },
          onChanged: (value) {
            if (value.isEmpty) {
              controller.isNewPasswordError.value = false;
            } else if (value.length < 8) {
              controller.isNewPasswordError.value = true;
              controller.newPasswordErrorMessage.value =
                  "Password harus lebih dari 8 karakter";
            } else {
              debugPrint("Kebobolan");
              controller.isNewPasswordError.value = false;
            }
          },
          controller: controller.newPasswordController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: controller.showNewPassword.value,
          decoration: InputDecoration(
            errorText: controller.isNewPasswordError.isTrue
                ? controller.newPasswordErrorMessage.value
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
                controller.showNewPassword.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Colors.black54,
              ),
              onPressed: () {
                controller.toggleObscureTextNewPassword();
              },
            ),
          ),
        ),
      ),
    );
  }
}
