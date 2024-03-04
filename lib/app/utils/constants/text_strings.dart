import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/constants/text_style.dart';

class TextStrings {
  // onboarding title
  static const String onboardingTitle1 = "Monitor Status Penggunaan Obat";
  static const String onboardingTitle2 =
      "Minum Obat Tepat Waktu dengan Fitur Ingatan";
  static const String onboardingTitle3 = "Edukasi Seputar Hipertensi";

  // onboarding subtitle
  static const String onboardingSubTitle1 =
      "Menjajaki kondisi kesehatan anda dengan menggunakan alat pemantau status penggunaan obat yang canggih!";
  static const String onboardingSubTitle2 =
      "Jalani Hidup sehat dengan Menggunakan Fitur Ingatkan";
  static const String onboardingSubTitle3 =
      "Temukan fakta-fakta penting yang perlu Anda ketahui mengenai hipertensi, mulai dari akar penyebab hingga langkah-langkah pencegahan";

  //Auth title
  static const String authTitle1 = "Selamat Datang 👋";
  static const String authTitle2 = "Email";
  static const String authTitle3 = "Password";
  static const String authTitle4 = "Username";

  //Auth subtitle
  static const String authSubtitle1 = "Masukkan Email";
  static const String authSubtitle2 = "Masukkan Password";
  static const String authSubtitle3 = "Masukkan Username";
  static RichText authSubtitle4 = RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(text: "Dengan masuk, \nAnda ", style: StyleText.authSubtitle1),
        TextSpan(
            text: "menerima persyaratan layanan ",
            style: StyleText.signInSubtitle2),
        TextSpan(text: "dan ", style: StyleText.authSubtitle1),
        TextSpan(text: "kebijakan privasi ", style: StyleText.signInSubtitle2),
      ]));

  //Auth text
  static const String authText1 = "disini";

  //Sign In title
  static const String signInTitle1 =
      "Silahkan masukan Email dan Password Anda untuk masuk ke akun Anda.";
  static const String signTitle2 = "Masuk";

  //Sign In Subtitle
  static const String signInSubtitle1 = "Lupa Password?";
  static const String signInSubtitle2 = "Atau lanjutkan dengan";

  //Sign Up title
  static const String signUpTitle1 =
      "Silahkan masukan Username, Email, dan Password Anda untuk mendaftarkan akun Anda.";
  static const String signUpTitle2 = "Daftar";

  //Sign Up subtitle
}
