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
          child: Get.arguments['type'] == 'history'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(Get.width * 0.30, 24),
                          backgroundColor: Resources.color.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          controller.beforePage();
                        },
                        child: const Text("Kembali")),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(Get.width * 0.30, 24),
                          backgroundColor: Resources.color.primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          controller.isStart.isTrue
                              ? controller.nextPage()
                              : controller.isLastPage.value
                                  ? Get.back()
                                  : controller.nextPage();
                        },
                        child: controller.isLastPage.value
                            ? const Text("Selesai")
                            : const Text("Berikutnya"))
                  ],
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(Get.width - 42, 24),
                    backgroundColor: controller.isAnswerd.isFalse &&
                            controller.isStart.isFalse
                        ? const Color(0x4D6CE9B4)
                        : Resources.color.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (controller.isLastPage.value) {
                      controller.sendData();
                    } else if (controller.isStart.isTrue) {
                      debugPrint("Clicked");
                      controller.nextPage();
                    } else if (controller.isAnswerd.isFalse) {
                      null;
                    } else {
                      controller.isAnswerd.value = false;
                      debugPrint("terjawab : " +
                          controller.isAnswerd.value.toString());
                      controller.nextPage();
                    }
                  },
                  child: controller.isLastPage.value
                      ? const Text("Submit Survey")
                      : controller.isStart.isTrue
                          ? const Text("Mulai")
                          : const Icon(Icons.arrow_forward),
                ),
        ));
  }
}
