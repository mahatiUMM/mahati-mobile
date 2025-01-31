import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

import '../questionnaire_question_controller.dart';
import 'available_answer.dart';
import 'history_answers.dart';

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
          : Get.arguments['type'] == 'history'
              ?
              // jika type merupakan history dari questionnaire yang sudah dikerjakan
              HistoryAnswers(
                  controller: controller,
                  title: title,
                  desc: desc,
                )
              :
              // Jika type merupakan availabe dari questionnaire yang belum dikerjakan
              AvailableAnswers(controller: controller),
    );
  }
}
