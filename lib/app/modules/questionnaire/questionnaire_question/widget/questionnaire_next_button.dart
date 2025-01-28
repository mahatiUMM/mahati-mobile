import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/questionnaire_question_controller.dart';
import 'package:mahati_mobile/app/utils/dimensions/screen_dimensions.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class QuestionnaireNextButton extends GetView<QuestionnaireQuestionController> {
  const QuestionnaireNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Positioned(
          left: Get.width * 0.07,
          right: Get.width * 0.07,
          bottom: ScreenDimensions.bottomNavigationBarHeight(context) * 0.001,
          child: Column(
            children: [
              const SizedBox(height: 18),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(Get.width - 42, 24),
                  backgroundColor: controller.isAnswerd.isFalse
                      ? const Color(0x4D6CE9B4)
                      : Resources.color.primaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (controller.isLastPage.value) {
                    controller.sendData();
                  } else if (controller.isAnswerd.isFalse) {
                    null;
                  } else {
                    controller.isAnswerd.value = false;
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
