import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/questionnaire_question_controller.dart';
import 'package:mahati_mobile/app/utils/dimensions/screen_dimensions.dart';

class QuestionnaireNextButton extends GetView<QuestionnaireQuestionController> {
  const QuestionnaireNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: ScreenDimensions.bottomNavigationBarHeight(context) * 0.65,
      right: 25.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF40D99E),
          foregroundColor: Colors.white,
        ),
        onPressed: controller.nextPage,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
