import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/auth/sign_in/signin_controller.dart';
import 'package:mahati_mobile/app/modules/auth/sign_in/widget/body_signin.dart';
import 'package:mahati_mobile/app/utils/Colors/color_app.dart';
import 'package:mahati_mobile/app/utils/constants/text_strings.dart';
import 'package:mahati_mobile/app/utils/constants/text_style.dart';
import 'package:sizer/sizer.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: Get.width,
          height: Get.height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: ColorApp.backgroundColor),
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: Get.width,
                  height: Get.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.00, -1.00),
                      end: const Alignment(0, 0.5),
                      colors: [
                        ColorApp.primaryColor,
                        ColorApp.primaryColorOnGradient
                      ],
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: TextStrings.authTitle1,
                                style: StyleText.authTitle1),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 90.w,
                        child: Text(
                          TextStrings.signInSubtitle1,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: ColorApp.subTitleColor,
                            fontSize: 11.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      BodySignIn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
