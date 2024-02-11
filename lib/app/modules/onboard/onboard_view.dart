import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_controller.dart';
import 'package:mahati_mobile/app/modules/onboard/widget/dot_navigation.dart';
import 'package:mahati_mobile/app/modules/onboard/widget/next_button.dart';
import 'package:mahati_mobile/app/modules/onboard/widget/onboarding_page.dart';
import 'package:mahati_mobile/app/modules/onboard/widget/skip_button.dart';
import 'package:mahati_mobile/app/utils/constants/animation_urls.dart';
import 'package:mahati_mobile/app/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class OnboardView extends GetView<OnBoardController> {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Resources.color.whiteColor,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // onboarding pages
              PageView(
                controller: controller.pageController,
                onPageChanged: controller.updatePageIndicator,
                children: const [
                  // page - 1
                  OnBoardingPage(
                    animationUrl: AnimationUrls.pillAnimation,
                    title: TextStrings.onboardingTitle1,
                    subTitle: TextStrings.onboardingSubTitle1,
                  ),
                  // page - 2
                  OnBoardingPage(
                    animationUrl: AnimationUrls.timeAnimation,
                    title: TextStrings.onboardingTitle2,
                    subTitle: TextStrings.onboardingSubTitle2,
                  ),
                  // page - 3
                  OnBoardingPage(
                    animationUrl: AnimationUrls.educationAnimation,
                    title: TextStrings.onboardingTitle3,
                    subTitle: TextStrings.onboardingSubTitle3,
                  ),
                ],
              ),
              const DotNavigation(),

              // skip button
              const SkipButton(),

              // dot navigation smooth indicator

              // circular button
              const NextButton(),
            ],
          ),
        ),
      ),
    );
  }
}
