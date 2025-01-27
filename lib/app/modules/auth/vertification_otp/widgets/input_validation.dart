import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:pinput/pinput.dart';

import '../verification_email_controller.dart';

class InputValidation extends StatelessWidget {
  InputValidation({
    super.key,
    required this.controller,
  });

  final VerificationEmailController controller;
  final defaultPinTheme = PinTheme(
    margin: const EdgeInsetsDirectional.all(4),
    width: Get.width * 0.13,
    height: Get.width * 0.13,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Resources.color.primaryColor2),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            errorText: "Invalid OTP",
            errorTextStyle: TextStyle(
                fontSize: 14,
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontFamily: Resources.font.primaryFont),
            length: 5,
            keyboardType: TextInputType.number,
            controller: controller.pinController,
            focusNode: controller.focusNode,
            defaultPinTheme: defaultPinTheme,
            separatorBuilder: (index) => const SizedBox(width: 8),
            hapticFeedbackType: HapticFeedbackType.lightImpact,
            validator: (value) {
              // controller.formKey.currentState!.validate();
              return EmailOTP.verifyOTP(otp: value!) ? null : "Invalid OTP";
            },
            onTap: () => controller.focusNode.requestFocus(),
            onCompleted: (pin) {
              debugPrint('onCompleted: $pin');
              controller.pin.value = pin;
            },
            onChanged: (value) {
              controller.pin.value = "";
              debugPrint('onChanged: $value');
            },
            cursor: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  width: Get.width * 0.06,
                  height: 1,
                  color: Resources.color.primaryColor,
                ),
              ],
            ),
            focusedPinTheme: defaultPinTheme.copyWith(
              margin: const EdgeInsetsDirectional.all(2),
              width: Get.width * 0.14,
              height: Get.width * 0.14,
              decoration: defaultPinTheme.decoration!.copyWith(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Resources.color.primaryColor),
              ),
            ),
            submittedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Resources.color.primaryColor),
              ),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
        ),
      ),
    );
  }
}
