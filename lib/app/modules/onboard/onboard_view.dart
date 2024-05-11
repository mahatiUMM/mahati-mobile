import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_controller.dart';
import 'package:mahati_mobile/app/modules/onboard/widget/dot_navigation.dart';
import 'package:mahati_mobile/app/modules/onboard/widget/next_button.dart';
import 'package:mahati_mobile/app/modules/onboard/widget/lottie_onboard.dart';
import 'package:mahati_mobile/app/modules/onboard/widget/skip_button.dart';
import 'package:mahati_mobile/app/utils/constants/animation_urls.dart';
import 'package:mahati_mobile/app/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class OnboardView extends GetView<OnBoardController> {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Resources.color.backgroundHome2,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Container(
        color: Resources.color.backgroundHome2,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                controller: controller.pageController,
                onPageChanged: controller.updatePageIndicator,
                children: const [
                  LottieOnboard(
                    animationUrl: AnimationUrls.pillAnimation,
                    title: TextStrings.onboardingTitle1,
                    subTitle: TextStrings.onboardingSubTitle1,
                  ),
                  LottieOnboard(
                    animationUrl: AnimationUrls.timeAnimation,
                    title: TextStrings.onboardingTitle2,
                    subTitle: TextStrings.onboardingSubTitle2,
                  ),
                  LottieOnboard(
                    animationUrl: AnimationUrls.educationAnimation,
                    title: TextStrings.onboardingTitle3,
                    subTitle: TextStrings.onboardingSubTitle3,
                  ),
                ],
              ),
              const DotNavigation(),
              const SkipButton(),
              const NextButton(),
            ],
          ),
        ),
      ),
    );
  }
}
