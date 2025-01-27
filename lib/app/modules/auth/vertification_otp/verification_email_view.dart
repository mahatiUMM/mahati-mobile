import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/network/smpt_email.dart';
import 'package:mahati_mobile/app/modules/auth/vertification_otp/verification_email_controller.dart';
import 'package:mahati_mobile/app/routes/app_pages.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

import 'widgets/input_validation.dart';

class VerificationEmailView extends GetView<VerificationEmailController> {
  const VerificationEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    // data from previous page
    debugPrint(
        'ini pasing data: ${controller.username} ${controller.email} ${controller.password} ${controller.number}');
    controller.startTimer();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                      'assets/svgs/verification.svg',
                      width: Get.width * 0.8,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Text(
                    'OTP Verification',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: Resources.font.primaryFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(children: [
                        TextSpan(
                          text:
                              'We Will send you a one time password on \nthis ',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: Resources.font.primaryFont,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text: 'Email',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: Resources.font.primaryFont,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ])),
                  SizedBox(height: Get.height * 0.01),
                  Obx(() => Text(
                        controller.email.value.isEmpty
                            ? 'Unknow Error'
                            : controller.email.value,
                        style: TextStyle(
                          fontFamily: Resources.font.primaryFont,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  SizedBox(height: Get.height * 0.02),
                  InputValidation(controller: controller),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Obx(() {
                    return Text(
                      controller.timeString.value,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: Resources.font.primaryFont,
                          color: Resources.color.baseColor1),
                    );
                  }),
                  SizedBox(height: Get.height * 0.01),
                  Obx(() {
                    return GestureDetector(
                      onTap: () {
                        controller.isTimerRunning.value
                            ? null
                            : EmailVerification()
                                .emailConfig(dotenv.get('USERNAME'));
                        EmailOTP.sendOTP(email: controller.email.value);
                        controller.otp.value = EmailOTP.getOTP().toString();
                        debugPrint(controller.otp.value);
                        controller.startTimer();
                      },
                      child: Text.rich(TextSpan(
                        children: [
                          TextSpan(
                              text: "Tidak mengirimkan OTP? ",
                              style: TextStyle(
                                  color: controller.isTimerRunning.value
                                      ? const Color(0x4D000000)
                                      : Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  fontFamily: Resources.font.primaryFont)),
                          TextSpan(
                              text: "Kirim ulang OTP",
                              style: TextStyle(
                                  color: controller.isTimerRunning.value
                                      ? const Color(0x4D40D99E)
                                      : Resources.color.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: Resources.font.primaryFont))
                        ],
                      )),
                    );
                  }),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Obx(() => ElevatedButton(
                        onPressed: () async {
                          if (controller.pin.value.isEmpty) {
                            return;
                          } else {
                            controller.focusNode.unfocus();
                            switch (controller.otpFor.value) {
                              case "reset":
                                controller.formKey.currentState!.validate()
                                    ? Get.offAndToNamed(Routes.forgetPassword)
                                    : null;

                                print(
                                    "ini formkey validator: ${controller.formKey.currentState!.validate()}");
                                break;
                              case "signup":
                                controller.formKey.currentState!.validate()
                                    ? Get.snackbar("Success", "Berhasil daftar")
                                    : Get.snackbar("Failed", "gagal daftar");
                                await controller.signUpController
                                    .registerAccount(
                                        username: controller.username.value,
                                        email: controller.email.value,
                                        password: controller.password.value,
                                        number: controller.number.value);
                                print(
                                    "ini formkey validator: ${controller.formKey.currentState!.validate()}");
                                break;
                              default:
                            }
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            backgroundColor: controller.pin.value.isEmpty
                                ? const MaterialStatePropertyAll(
                                    Color(0x4D6CE9B4))
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
        ),
      ),
    );
  }
}
