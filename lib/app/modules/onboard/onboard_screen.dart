import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_controller.dart';
import 'package:mahati_mobile/app/modules/onboard/widget/dot_navigation.dart';
import 'package:mahati_mobile/app/modules/onboard/widget/next_button.dart';
import 'package:mahati_mobile/app/modules/onboard/widget/onboarding_page.dart';
import 'package:mahati_mobile/app/modules/onboard/widget/skip_button.dart';
import 'package:mahati_mobile/app/utils/constants/image_urls.dart';
import 'package:mahati_mobile/app/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Container(
        color: Color(0xFFFFFFFF),
        child: SafeArea(
          child: Stack(
            children: [
              // onboarding pages
              PageView(
                controller: controller.pageController,
                onPageChanged: controller.updatePageIndicator,
                children: const [
                  // page - 1
                  OnBoardingPage(
                    imageUrl: ImageUrls.onboardingGif,
                    title: TextStrings.onboardingTitle1,
                    subTitle: TextStrings.onboardingSubTitle1,
                  ),
                  // page - 2
                  OnBoardingPage(
                    imageUrl: ImageUrls.onboardingGif,
                    title: TextStrings.onboardingTitle2,
                    subTitle: TextStrings.onboardingSubTitle2,
                  ),
                  // page - 3
                  OnBoardingPage(
                    imageUrl: ImageUrls.onboardingGif,
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
