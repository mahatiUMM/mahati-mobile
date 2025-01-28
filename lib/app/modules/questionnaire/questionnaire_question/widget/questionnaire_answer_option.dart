import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

import '../questionnaire_question_controller.dart';

class QuestionnaireAnswerOption extends StatelessWidget {
  const QuestionnaireAnswerOption(
      {super.key,
      required this.controller,
      required this.title,
      required this.desc});

  final String title;
  final String desc;
  final QuestionnaireQuestionController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isStart.isTrue
          ? PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Resources.color.subtitleColor,
                          fontSize: 18,
                          fontFamily: Resources.font.primaryFont,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Text(
                      desc,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Resources.color.subtitleColor,
                          fontSize: 14,
                          fontFamily: Resources.font.primaryFont,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    SizedBox(
                        width: Get.width,
                        child: Text(
                          "Total pertanyan : ${controller.pageLength.string} pertanyaan",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Resources.color.subtitleColor,
                              fontSize: 14,
                              fontFamily: Resources.font.primaryFont,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                )
              ],
            )
          : PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              physics: const NeverScrollableScrollPhysics(),
              children: controller.questionnaireQuestion.map((question) {
                return SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          question.question ?? "",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: Resources.font.primaryFont,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        SizedBox(
                          width: Get.width,
                          child: Text(
                            "Jawab dengan jujur",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: const Color(0xFFB2B2B2),
                                fontFamily: Resources.font.primaryFont,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        ...question.availableAnswers.map((answer) {
                          bool isSelected = controller.selectedAnswer
                              .any((element) => element[2] == answer.id);
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              width: Get.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected
                                      ? Resources.color.primaryColor
                                      : Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                // color: Resources.color.whiteColor,
                              ),
                              child: RadioListTile<int>(
                                activeColor: Resources.color.primaryColor,
                                focusNode: controller.focusNode,
                                autofocus: true,
                                title: Text(
                                  answer.answerText ?? "",
                                  style: TextStyle(
                                    color: Resources.color.titleColor,
                                  ),
                                ),
                                value: answer.id ?? 0,
                                groupValue: controller.selectedAnswer.isNotEmpty
                                    ? controller.selectedAnswer.firstWhere(
                                        (element) =>
                                            element[1] ==
                                            answer.questionnaireQuestionId,
                                        orElse: () => [-1, -1, -1],
                                      )[2]
                                    : -1,
                                onChanged: (_) {
                                  debugPrint(
                                      "answer yang dipilih: ${answer.id}");
                                  controller.isAnswerd.value = true;
                                  controller.setSelectedAnswer(
                                    answer.questionnaireQuestionId ?? 0,
                                    answer.id ?? 0,
                                  );
                                },
                                contentPadding: const EdgeInsets.only(left: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          );
                        }),
                      ]),
                );
              }).toList(),
            ),
    );
  }
}