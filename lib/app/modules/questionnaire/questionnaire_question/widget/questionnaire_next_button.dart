import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/questionnaire_question_controller.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/widget/questionnaire_page_indicator.dart';
import 'package:mahati_mobile/app/utils/dimensions/screen_dimensions.dart';

class QuestionnaireNextButton extends GetView<QuestionnaireQuestionController> {
  const QuestionnaireNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = context.width;

    return Obx(() => Positioned(
          left: (screenWidth - (Get.width - 42)) / 2,
          bottom: ScreenDimensions.bottomNavigationBarHeight(context) * 0.65,
          child: Column(
            children: [
              const QuestionnairePageIndicator(),
              const SizedBox(height: 18),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(Get.width - 42, 24),
                  backgroundColor: const Color(0xFF40D99E),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (controller.isLastPage.value) {
                    controller.sendData();
                  } else {
                    controller.nextPage();
                  }
                },
                child: controller.isLastPage.value
                    ? const Text("Submit Survey")
                    : const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ));
  }
}
