import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/constants/text_style.dart';

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
  static const String authTitle5 = "Phone Number";

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

  // Home greeting
  static const String homeGreeting = "Selamat Datang!";


  // Frequently asked questions
  static const String appName = 'MAHATI';
  static const String faqHeader0 = "Hubungi kami";
  static const String faqHeader1 = "Apa itu MAHATI?";
  static const String faqContent1 = "adalah aplikasi mobile kesehatan yang dirancang untuk membantu pasien hipertensi memantau kesehatan jantung, menjadi asisten pengingat obat, serta memberikan edukasi terkait kesehatan.";
  static const String faqHeader2 = "Apa saja fitur utama yang ditawarkan oleh MAHATI?";
  static const String faqContent2 = "1) Pemantauan Kesehatan Jantung: Membantu pengguna mencatat dan menganalisis tekanan darah serta detak jantung. \n2) Pengingat Obat: Mengatur jadwal pengingat agar tidak lupa mengonsumsi obat. \n3) Edukasi Kesehatan: Menyediakan artikel, tips, dan panduan terkait hipertensi dan kesehatan jantung. \n 4) Riwayat Kesehatan: Menyimpan data kesehatan pengguna untuk memudahkan konsultasi dengan dokter.";
  static const String faqHeader3 = "Apakah MAHATI dapat memberikan diagnosa kesehatan?";
  static const String faqContent3 = "MAHATI tidak menggantikan peran dokter. Aplikasi ini membantu mencatat data kesehatan Anda, yang dapat digunakan sebagai referensi saat berkonsultasi dengan tenaga medis.";
  static const String faqHeader4 = "Apakah data kesehatan saya aman di MAHATI?";
  static const String faqContent4 = "Kami menjamin keamanan data Anda dengan menerapkan protokol keamanan yang ketat, seperti enkripsi data. Informasi Anda tidak akan dibagikan kepada pihak ketiga tanpa persetujuan Anda.";  
}
