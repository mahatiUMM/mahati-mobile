import 'package:cached_network_image/cached_network_image.dart';
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
              background: CachedNetworkImage(
                imageUrl: Get.arguments['image'],
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.chevron_left,
                          color: Resources.color.baseColor,
                        ),
                        Text(
                          'Kembali',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: Resources.font.primaryFont,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height - 300,
                        child: Stack(
                          children: [
                            Obx(() {
                              return PageView(
                                controller: controller.pageController,
                                onPageChanged: controller.updatePageIndicator,
                                physics: const NeverScrollableScrollPhysics(),
                                children: controller.questionnaireQuestion
                                    .map((question) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        18, 0, 18, 92),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            question.question ?? "",
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          const SizedBox(height: 42.0),
                                          Column(
                                            children: question.availableAnswers
                                                .map((answer) {
                                              bool isSelected = controller
                                                  .selectedAnswer
                                                  .any((element) =>
                                                      element[2] == answer.id);
                                              return ElevatedButton(
                                                  onPressed: () {
                                                    controller.setSelectedAnswer(
                                                        answer.questionnaireQuestionId ??
                                                            0,
                                                        answer.id ?? 0);
                                                  },
                                                  style: ButtonStyle(
                                                    backgroundColor: isSelected
                                                        ? MaterialStateProperty
                                                            .all<Color>(Resources
                                                                .color
                                                                .primaryColor) // Change color if selected
                                                        : MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.white),
                                                  ),
                                                  child: Text(
                                                    answer.answerText ?? "",
                                                    style: TextStyle(
                                                        color: isSelected
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 18),
                                                  ));
                                            }).toList(),
                                          ),
                                        ]),
                                  );
                                }).toList(),
                              );
                            }),
                            const QuestionnairePageIndicator(),
                            const QuestionnaireNextButton(),
                          ],
                        ),
                      )
                    ],
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
