import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/routes/app_pages.dart';
import 'package:mahati_mobile/app/utils/Colors/color_app.dart';
import 'package:mahati_mobile/app/utils/constants/text_strings.dart';
import 'package:mahati_mobile/app/utils/constants/text_style.dart';
import 'package:sizer/sizer.dart';

class BodySignUp extends GetView {
  BodySignUp({super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: ShapeDecoration(
          color: ColorApp.backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 30, 25.0, 25.0),
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
                height: Get.height / 16,
                width: Get.width,
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorApp.textFieldColor,
                      hintText: TextStrings.authSubtitle3,
                      hintStyle: StyleText.signInField,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorApp.textFieldColor),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorApp.textFieldColor),
                          borderRadius: BorderRadius.circular(15))),
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
              SizedBox(
                height: Get.height / 16,
                width: Get.width,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorApp.textFieldColor,
                      hintText: TextStrings.authSubtitle1,
                      hintStyle: StyleText.signInField,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorApp.textFieldColor),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorApp.textFieldColor),
                          borderRadius: BorderRadius.circular(15))),
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
              SizedBox(
                height: Get.height / 16,
                width: Get.width,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorApp.textFieldColor,
                      hintText: TextStrings.authSubtitle2,
                      hintStyle: StyleText.signInField,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorApp.textFieldColor),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorApp.textFieldColor),
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 1000.w,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {},
                    child: Text(
                      TextStrings.signUpTitle2,
                      style: StyleText.authElevatedButton,
                    )),
              ),
              SizedBox(
                height: 5.h,
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
