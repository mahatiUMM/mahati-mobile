import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_controller.dart';
import 'package:mahati_mobile/app/utils/dimensions/screen_dimensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotNavigation extends StatelessWidget {
  const DotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;

    return Positioned(
      // bottom: ScreenDimensions.bottomNavigationBarHeight(context),
      // left: 25.0,
      
      child: SmoothPageIndicator(
        // navigation dot clicked
        onDotClicked: controller.dotNavigatorClick,
        // dots controllers to detect the current page
        controller: controller.pageController,
        effect: const ExpandingDotsEffect(
            dotHeight: 7, activeDotColor: Color(0xFF40D99E)),
        count: 3,
      ),
    );
  }
}
