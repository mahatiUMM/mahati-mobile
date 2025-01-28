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
    return Obx(() => Positioned(
          bottom: ScreenDimensions.bottomNavigationBarHeight(context) * 0.9,
          child: Container(
            width: Get.width,
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: SingleChildScrollView(
              controller: controller.indicatorScrollController,
              scrollDirection: Axis.horizontal,
              child: SmoothPageIndicator(
                axisDirection: Axis.horizontal,
                controller: controller.pageController,
                effect: const ExpandingDotsEffect(
                  dotHeight: 7,
                  dotWidth: 15.0,
                  activeDotColor: Color(0xFF40D99E),
                ),
                count: controller.questionnaireQuestion.isEmpty
                    ? 1
                    : controller.questionnaireQuestion.length,
              ),
            ),
          ),
        ));
  }
}
