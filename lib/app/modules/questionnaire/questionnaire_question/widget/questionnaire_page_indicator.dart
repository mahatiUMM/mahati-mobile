import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/questionnaire_question_controller.dart';
import 'package:mahati_mobile/app/utils/dimensions/screen_dimensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuestionnairePageIndicator
    extends GetView<QuestionnaireQuestionController> {
  const QuestionnairePageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: ScreenDimensions.bottomNavigationBarHeight(context) * 3.4,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        effect: const ExpandingDotsEffect(
          dotHeight: 7,
          activeDotColor: Color(0xFF40D99E),
        ),
        count: 2,
      ),
    );
  }
}
