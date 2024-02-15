import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/auth/sign_in/signin_controller.dart';
import 'package:mahati_mobile/app/modules/auth/sign_in/widget/body_signin.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: Get.width,
              height: Get.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 0.5),
                  colors: [Color(0xFF40D99E), Color(0x0040D99E)],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Selamat Datang 👋',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xFF11371C),
                          fontSize: 28,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  width: 325,
                  child: Text(
                    'Silahkan masukan Email dan Password Anda untuk masuk ke akun Anda.',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Color(0xFF383838),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const BodySignIn(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/signup");
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Belum punya akun? ',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFF11371C),
                            fontSize: 17,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Daftar disini',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFF40D99E),
                            fontSize: 17,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
