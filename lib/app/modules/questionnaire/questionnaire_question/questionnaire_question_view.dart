import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/questionnaire_question_controller.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/widget/questionnaire_answer_option.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/widget/questionnaire_next_button.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/widget/questionnaire_page_indicator.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class QuestionnaireQuestionView
    extends GetView<QuestionnaireQuestionController> {
  const QuestionnaireQuestionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.backgroundHome,
        surfaceTintColor: AppColors.backgroundHome,
        elevation: 0,
        backgroundColor: AppColors.backgroundHome,
        automaticallyImplyLeading: false, // Disable default back button
        titleSpacing: 0, // Remove default spacing
        title: Row(
          children: [
            IconButton(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              constraints:
                  const BoxConstraints(), // Remove minimum size constraints
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.black),
              onPressed: () => Get.back(),
            ),
            Text(
              'Kembali',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: Resources.font.primaryFont),
            ),
          ],
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: Get.height,
            minHeight: Get.height,
            maxWidth: Get.width,
            minWidth: Get.width),
        child: Stack(children: [
          SizedBox(
            height: Get.height * 0.25,
            child: Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.elliptical(20, 15),
                    bottomRight: Radius.elliptical(20, 14)),
                child: CachedNetworkImage(
                  imageUrl: Get.arguments['image'].isNotEmpty == true
                      ? dotenv.get('IMAGE_URL') + Get.arguments['image']
                      : 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png?20210521171500',
                  fit: BoxFit.cover,
                  width: Get.width,
                  height: Get.height * 0.4,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Positioned(
            left: Get.width * 0.07, right: Get.width * 0.07,
            bottom: Get.height * 0.1,
            top: Get.height * 0.17, // This will make it overlap with the image
            child: Container(
              height:
                  Get.height * 0.65, // Adjusted height to fill remaining space
              width: Get.width,
              decoration: BoxDecoration(
                color: Resources.color.whiteColor,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                child: QuestionnaireAnswerOption(
                  controller: controller,
                  title: Get.arguments['title'],
                  desc: Get.arguments['desc'],
                ),
              ),
            ),
          ),
          const QuestionnairePageIndicator(),
          const QuestionnaireNextButton()
        ]),
      ),
      backgroundColor: AppColors.backgroundHome,
    );
  }
}
