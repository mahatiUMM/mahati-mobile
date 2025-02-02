import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

import '../questionnaire_controller.dart';
import 'questionnaire_card.dart';

class QuestionnaireAvailable extends StatelessWidget {
  const QuestionnaireAvailable({
    super.key,
    required this.controller,
  });

  final QuestionnaireController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.isTrue) {
        return Center(
          child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Resources.color.primaryColor)),
        );
      } else {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    "Hai, ${controller.username.value}",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontFamily: Resources.font.primaryFont,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    "Anda dapat mengisi kuesioner section dibawah ini",
                    style: TextStyle(
                      fontFamily: Resources.font.primaryFont,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 18.0),
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
                            // debugPrint("is fill : ${controller.isFilled}");
                            final isFilledValue =
                                controller.isFilled.firstWhere(
                              (element) =>
                                  element.keys.first == questionnaire.id,
                              orElse: () => {questionnaire.id!: false},
                            )[questionnaire.id];
                            return Padding(
                              padding: const EdgeInsets.only(top: 18),
                              child: QuestionnaireCard(
                                // pengecekan id, jika id sesuai index ada, maka melakukan return true, jika id sesuai index tidak cocok maka return false
                                isFilled: isFilledValue!,
                                title: questionnaire.title!,
                                description: questionnaire.description!,
                                imageUrl: questionnaire.image?.isNotEmpty ==
                                        true
                                    ? dotenv.get('IMAGE_URL') +
                                        questionnaire.image!
                                    : 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png?20210521171500',
                                onPressed: () {
                                  // pengecekan id, jika id sesuai index ada, maka melakukan return get tonamed, jika id sesuai index tidak cocok maka return null
                                  debugPrint("isFilledValue: $isFilledValue");
                                  isFilledValue == true
                                      ? null
                                      : Get.toNamed('/questionnaire_question',
                                          arguments: {
                                              'id': questionnaire.id,
                                              'image':
                                                  questionnaire.image ?? '',
                                              'title':
                                                  questionnaire.title ?? '',
                                              'desc':
                                                  questionnaire.description ??
                                                      '',
                                              'type': 'available'
                                            });
                                },
                              ),
                            );
                          },
                        );
                      }
                    }),
                  ],
                )
              ],
            ),
          ),
        );
      }
    });
  }
}
