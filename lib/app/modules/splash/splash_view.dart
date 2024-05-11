import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/splash/splash_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Resources.color.whiteColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: Resources.color.whiteColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: SvgPicture.asset(
                controller.logo,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "mahati.\n",
                      style: TextStyle(
                        color: Resources.color.baseColor,
                        fontFamily: Resources.font.primaryFont,
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(height: 30.0),
                    ),
                    TextSpan(
                      text: "Mobile Aplikasi Sahabat\nHipertensi",
                      style: TextStyle(
                        color: Resources.color.baseColor,
                        fontFamily: Resources.font.primaryFont,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
