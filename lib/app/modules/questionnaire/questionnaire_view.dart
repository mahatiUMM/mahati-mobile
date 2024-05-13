import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_controller.dart';
import 'package:mahati_mobile/app/modules/questionnaire/widget/questionnaire_card.dart';

class QuestionnaireView extends GetView<QuestionnaireController> {
  const QuestionnaireView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 64.0,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  "Hai, ${controller.username.value}",
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w700),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  "Anda dapat mengisi kuesioner section dibawah ini",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 52.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Direkomendasikan",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    QuestionnaireCard(
                      title: "Hipertensi",
                      description: "Cek hipertensi Anda!",
                      imageUrl:
                          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSpN_Yef2oTU3AsTtr23e3bIHhEKqvZxzyQm_F7ZlaeZgZUzIdG',
                      onPressed: () {},
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 32.0),
                      child: Text(
                        "Semua Kuesioner",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.secondary),
                          ),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.questionnaires.length,
                          itemBuilder: (context, index) {
                            var questionnaire =
                                controller.questionnaires[index];
                            return QuestionnaireCard(
                              title: questionnaire.title!,
                              description: questionnaire.description!,
                              imageUrl: questionnaire.image ?? "",
                              onPressed: () {
                                // Get.to(QuestionnaireQuestionView(), arguments: {'questionnaire': questionnaire});
                                Get.toNamed('/questionnaire_question',
                                    arguments: {
                                      'questionnaire': questionnaire,
                                      'questionnaire_questions':
                                          questionnaire.question
                                    });
                              },
                            );
                          },
                        );
                      }
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
