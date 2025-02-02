import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/network/smpt_email.dart';
import 'package:mahati_mobile/app/modules/auth/sign_up/signup_controller.dart';
import 'package:mahati_mobile/app/routes/app_pages.dart';
import 'package:mahati_mobile/app/constants/text_strings.dart';
import 'package:mahati_mobile/app/constants/text_style.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

class BodySignUp extends GetView<SignUpController> {
  const BodySignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: ShapeDecoration(
          color: Resources.color.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 15, 25.0, 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TextStrings.authTitle4,
                style: StyleText.authTitle2,
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: controller.isUsernameInvalid.isTrue
                    ? Get.height * 0.09
                    : Get.height * 0.06,
                width: Get.width,
                child: TextField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                      errorText: controller.isUsernameInvalid.isTrue
                          ? controller.errorUsernameMessage.value
                          : null,
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Resources.color.secondaryColor2)),
                      filled: true,
                      fillColor: Resources.color.textFieldColor,
                      hintText: TextStrings.authSubtitle3,
                      hintStyle: StyleText.signInField,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Resources.color.textFieldColor),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Resources.color.textFieldColor),
                          borderRadius: BorderRadius.circular(15))),
                  onEditingComplete: () => controller.validateUsername(),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      controller.isUsernameInvalid.value = false;
                    } else {
                      controller.validateUsername();
                    }
                  },
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                TextStrings.authTitle2,
                style: StyleText.authTitle2,
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => SizedBox(
                  height: controller.isEmailInvalid.isFalse
                      ? Get.height * 0.06
                      : Get.height * 0.09,
                  width: Get.width,
                  child: TextField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        errorText: controller.isEmailInvalid.isTrue
                            ? controller.errorEmailMessage.value
                            : null,
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Resources.color.secondaryColor2)),
                        filled: true,
                        fillColor: Resources.color.textFieldColor,
                        hintText: TextStrings.authSubtitle1,
                        hintStyle: StyleText.signInField,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Resources.color.textFieldColor),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Resources.color.textFieldColor),
                            borderRadius: BorderRadius.circular(15))),
                    onEditingComplete: () => controller.validateEmail(),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        controller.isEmailInvalid.value = false;
                      } else {
                        controller.validateEmail();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                TextStrings.authTitle5,
                style: StyleText.authTitle2,
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => SizedBox(
                  height: controller.isPhoneNumberInvalid.isFalse
                      ? Get.height * 0.06
                      : Get.height * 0.09,
                  width: Get.width,
                  child: TextField(
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          errorText: controller.isPhoneNumberInvalid.isTrue
                              ? controller.errorPhoneMessage.value
                              : null,
                          errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Resources.color.secondaryColor2)),
                          filled: true,
                          fillColor: Resources.color.textFieldColor,
                          hintText: "08xxxx",
                          hintStyle: StyleText.signInField,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Resources.color.textFieldColor),
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Resources.color.textFieldColor),
                              borderRadius: BorderRadius.circular(15))),
                      onEditingComplete: () {
                        controller.validatePhoneNumber();
                      },
                      onChanged: (value) {
                        if (value.isEmpty) {
                          controller.isPhoneNumberInvalid.value = false;
                        } else {
                          controller.validatePhoneNumber();
                        }
                      }),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                TextStrings.authTitle3,
                style: StyleText.authTitle2,
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => SizedBox(
                  height: controller.isPasswordInvalid.isFalse
                      ? Get.height * 0.06
                      : Get.height * 0.09,
                  width: Get.width,
                  child: TextField(
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.showPassword.value,
                      decoration: InputDecoration(
                        errorText: controller.isPasswordInvalid.isTrue
                            ? controller.errorPasswordMessage.value
                            : null,
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Resources.color.secondaryColor2)),
                        filled: true,
                        fillColor: Resources.color.textFieldColor,
                        hintText: TextStrings.authSubtitle2,
                        hintStyle: StyleText.signInField,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Resources.color.textFieldColor),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Resources.color.textFieldColor),
                            borderRadius: BorderRadius.circular(15)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.showPassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            controller.toggleObscureText();
                          },
                        ),
                      ),
                      onEditingComplete: () {
                        controller.validatePassword();
                      },
                      onChanged: (value) {
                        if (value.isEmpty) {
                          controller.isPasswordInvalid.value = false;
                        } else {
                          controller.validatePassword();
                        }
                      }),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => SizedBox(
                  width: 1000.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.usernameInput.isNotEmpty &&
                                controller.emailInput.isNotEmpty &&
                                controller.passwordInput.isNotEmpty &&
                                controller.phoneNumberInput.isNotEmpty
                            ? Resources.color.primaryColor
                            : Resources.color.disableButtonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () async {
                        if (controller.usernameInput.isNotEmpty &&
                            controller.emailInput.isNotEmpty &&
                            controller.passwordInput.isNotEmpty &&
                            controller.phoneNumberInput.isNotEmpty) {
                          EmailVerification()
                              .emailTemplate(controller.usernameController.text);
                          EmailOTP.sendOTP(
                              email: controller.emailController.text);
                          Get.toNamed(Routes.verificationOTP, arguments: {
                            'username': controller.usernameController.text,
                            'email': controller.emailController.text,
                            'password': controller.passwordController.text,
                            'number': controller.phoneController.text,
                            'otp_for': 'signup'
                          });
                          debugPrint("Clicked");
                        } else {
                          debugPrint("Clicked Null");
                          null;
                        }
                      },
                      child: Text(
                        TextStrings.signUpTitle2,
                        style: StyleText.authElevatedButton,
                      )),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                alignment: Alignment.center,
                width: 100.w,
                child: SizedBox(
                  width: 70.w,
                  child: TextStrings.authSubtitle4,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 100.w,
                child: GestureDetector(
                  onTap: () {
                    Get.offAllNamed(Routes.signin);
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Sudah punya akun? ',
                            style: StyleText.authSubtitle1),
                        TextSpan(
                            text: 'Masuk disini',
                            style: StyleText.authTextButton),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
