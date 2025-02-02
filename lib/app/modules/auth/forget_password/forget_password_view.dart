import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/constants/text_style.dart';
import 'package:mahati_mobile/app/modules/auth/forget_password/forget_password_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

import 'widgets/confirm_password_form.dart';
import 'widgets/new_password_form.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundHome,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundHome,
        surfaceTintColor: AppColors.backgroundHome,
        automaticallyImplyLeading: false, // Disable default back button
        titleSpacing: 0, // Remove default spacing
        title: Row(
          children: [
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              constraints:
                  const BoxConstraints(), // Remove minimum size constraints
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.black),
              onPressed: () => Get.back(),
            ),
            Text(
              'Kembali',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: Resources.font.primaryFont),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: Get.height,
            minWidth: Get.width,
            maxHeight: Get.height,
            maxWidth: Get.width),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/svgs/reset_password.svg',
                    width: Get.width * 0.75,
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    "Password Baru",
                    style: StyleText.authTitle2,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                NewPasswordForm(controller: controller),
                SizedBox(height: Get.height * 0.03),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    "Konfirmasi Password",
                    style: StyleText.authTitle2,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                ConfirmPasswordForm(controller: controller),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Obx(() => ElevatedButton(
                      onPressed: () async {
                        controller.isNewPasswordError.isTrue ||
                                controller.isConfirmPasswordError.isTrue ||
                                controller.confirmPassword.value.length < 8 ||
                                controller.confirmPassword.value !=
                                    controller.newPassword.value
                            ? null
                            : await controller.updatePassword();
                      },
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          backgroundColor: controller
                                      .isNewPasswordError.isTrue ||
                                  controller.isNewPasswordError.isTrue ||
                                  controller.confirmPassword.value.length < 8 ||
                                  controller.confirmPassword.value !=
                                      controller.newPassword.value
                              ? MaterialStatePropertyAll(
                                  Resources.color.disableButtonColor)
                              : MaterialStatePropertyAll(
                                  Resources.color.primaryColor),
                          fixedSize: MaterialStatePropertyAll(
                              Size(Get.width, Get.height * 0.055))),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontFamily: Resources.font.primaryFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Resources.color.whiteColor),
                      ),
                    ))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
