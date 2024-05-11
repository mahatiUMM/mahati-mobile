import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/auth/sign_in/signin_controller.dart';
import 'package:mahati_mobile/app/modules/auth/sign_in/widget/body_signin.dart';
import 'package:mahati_mobile/app/utils/constants/text_strings.dart';
import 'package:mahati_mobile/app/utils/constants/text_style.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Sizer(builder: (context, orientation, devicetype) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: Get.width,
          height: Get.height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Resources.color.whiteColor,
          ),
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
                        Resources.color.primaryColor,
                        Resources.color.primaryColorOnGradient,
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
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        width: 90.w,
                        child: Text(TextStrings.signInTitle1,
                            style: StyleText.authSubtitle1),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      const BodySignIn(),
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
