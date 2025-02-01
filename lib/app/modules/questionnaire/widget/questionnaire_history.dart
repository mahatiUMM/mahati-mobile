import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

import '../questionnaire_controller.dart';
import 'questionnaire_card.dart';

class QuestionnaireHistory extends StatelessWidget {
  const QuestionnaireHistory({
    super.key,
    required this.controller,
  });

  final QuestionnaireController controller;

  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(
                    fontFamily: Resources.font.primaryFont,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                textAlign: TextAlign.justify,
                "Anda dapat melihat kuesioner yang sudah dilakukan dibawah ini",
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
                      itemCount: controller.questionnaireUserAlreadyUse.length,
                      itemBuilder: (context, index) {
                        final item =
                            controller.questionnaireUserAlreadyUse[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: QuestionnaireCard(
                            isFilled: false,
                            title: item.title,
                            description: item.description,
                            imageUrl: item.image?.isNotEmpty == true
                                ? dotenv.get('IMAGE_URL') + item.image!
                                : 'https://upload.wikimedia.org/wikipedia/commons/a/a3/Image-not-found.png?20210521171500',
                            onPressed: () {
                              Get.toNamed('/questionnaire_question',
                                  arguments: {
                                    'id': item.id,
                                    'image': item.image,
                                    'title': item.title,
                                    'desc': item.description,
                                    'type': 'history'
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
}
