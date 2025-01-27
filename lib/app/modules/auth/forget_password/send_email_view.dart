import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/constants/text_style.dart';
import 'package:mahati_mobile/app/core/network/smpt_email.dart';
import 'package:mahati_mobile/app/modules/auth/forget_password/forget_password_controller.dart';
import 'package:mahati_mobile/app/routes/app_pages.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class SendEmailView extends GetView<ForgetPasswordController> {
  const SendEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundHome,
      appBar: AppBar(
        foregroundColor: AppColors.backgroundHome,
        surfaceTintColor: AppColors.backgroundHome,
        elevation: 0,
        backgroundColor: AppColors.backgroundHome,
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
            padding: const EdgeInsets.all(24.0),
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
                  'Enter E-mail ID',
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
                      "Email",
                      textAlign: TextAlign.start,
                      style: StyleText.authTitle2,
                    )),
                SizedBox(height: Get.height * 0.01),
                Form(
                  key: controller.emailFormKey,
                  child: SizedBox(
                    height: Get.height * 0.08,
                    width: Get.width,
                    child: TextFormField(
                      focusNode: controller.emailFocusNode,
                      controller: controller.emailOTPController,
                      onEditingComplete: () {
                        controller.emailFocusNode.unfocus();
                        controller.emailID.value =
                            controller.emailOTPController.text;
                        if (controller.emailFormKey.currentState!.validate()) {
                          controller.isEmailError.value = false;
                          debugPrint(
                              "on edit completed : ${controller.isEmailError.value}");
                        } else {
                          controller.isEmailError.value = true;
                          debugPrint(
                              "on edit completed : ${controller.isEmailError.value}");
                        }
                      },
                      onTap: () => controller.emailFocusNode.requestFocus(),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        filled: true,
                        fillColor: const Color(0xFFF5F6F8),
                        hintText:
                            'Enter your email', // Ganti dengan TextStrings.authSubtitle1
                        hintStyle: TextStyle(color: Resources.color.hintColor),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFF5F6F8)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFF5F6F8)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      minLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        } else {
                          controller.isEmailError.value = false;
                          return null;
                        }
                      },
                      onChanged: (value) {
                        controller.emailID.value = '';
                        debugPrint("onChanged: $value");
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Obx(
                  () => ElevatedButton(
                    onPressed: () {
                      if (controller.isEmailError.value) {
                        return;
                      } else {
                        debugPrint("is error: ${controller.isEmailError.value}");
                        // Memvalidasi form menggunakan GlobalKey
                        if (controller.emailFormKey.currentState!.validate()) {
                          // Jika validasi berhasil, simpan nilai input
                          controller.emailFormKey.currentState!.save();
                          debugPrint(
                              "submit email forget password: ${controller.emailID.value}");
                          EmailVerification()
                              .emailTemplate(controller.emailID.value);
                          EmailOTP.sendOTP(email: controller.emailID.value);
                          Get.toNamed(Routes.verificationOTP, arguments: {
                            'email': controller.emailID.value,
                            'otp_for': 'reset'
                          });
                        } else {
                          // Jika validasi gagal, form akan menampilkan pesan kesalahan
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(Get.width, Get.height * 0.04),
                      backgroundColor: controller.isEmailError.value
                          ? const Color(0x4D6CE9B4)
                          : Resources.color.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ), // Menangani submit
                    child: Text(
                      'Send OTP',
                      style: StyleText.authElevatedButton,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
