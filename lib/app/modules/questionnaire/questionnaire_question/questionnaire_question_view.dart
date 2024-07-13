import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/questionnaire_question_controller.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/widget/questionnaire_next_button.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/widget/questionnaire_page_indicator.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class QuestionnaireQuestionView
    extends GetView<QuestionnaireQuestionController> {
  const QuestionnaireQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    // final Questionnaire questionnaire = Get.arguments['questionnaire'];
    // final List<QuestionnaireQuestion> questionnaireQuestionList =
    //     Get.arguments['questionnaire_questions'];
    // Now you can use the questionnaire object to access its properties
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
            ),
            expandedHeight: 275,
            backgroundColor: Resources.color.whiteColor,
            elevation: 0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                Get.arguments['image'],
                fit: BoxFit.cover,
              ),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Resources.color.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: Container(
                  width: 40.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Resources.color.baseColor,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ),
            leadingWidth: Get.width,
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/questionnaire');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.chevron_left,
                          color: Resources.color.baseColor,
                        ),
                        const Text(
                          'Kembali',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Resources.color.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Get.height - 275,
                          child: Stack(
                            children: [
                              Obx(() {
                                return PageView(
                                  controller: controller.pageController,
                                  onPageChanged: controller.updatePageIndicator,
                                  children: controller.questionnaireQuestion
                                      .map((question) {
                                    return Column(children: [
                                      Text(
                                        question.question ?? "",
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                      Column(
                                        children: question.availableAnswers
                                            .map((answer) {
                                          bool isSelected = controller
                                              .selectedAnswer
                                              .any((element) =>
                                                  element[1] == answer.id);
                                          return ElevatedButton(
                                              onPressed: () {
                                                controller.setSelectedAnswer(
                                                    answer.id ?? 0);
                                              },
                                              style: ButtonStyle(
                                                backgroundColor: isSelected
                                                    ? MaterialStateProperty
                                                        .all<Color>(Colors
                                                            .blue) // Change color if selected
                                                    : MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                )),
                                                side: MaterialStateProperty.all<
                                                    BorderSide>(BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0,
                                                )),
                                              ),
                                              child: Text(
                                                answer.answerText ?? "",
                                                style: const TextStyle(
                                                    fontSize: 18),
                                              ));
                                        }).toList(),
                                      ),
                                    ]);
                                  }).toList(),
                                );
                              }),
                              const QuestionnaireNextButton(),
                              const QuestionnairePageIndicator()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
