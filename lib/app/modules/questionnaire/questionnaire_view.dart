import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_controller.dart';
import 'package:mahati_mobile/app/modules/questionnaire/widget/questionnaire_card.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class QuestionnaireView extends GetView<QuestionnaireController> {
  const QuestionnaireView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Resources.color.backgroundHome2,
        elevation: 0,
        leadingWidth: 20,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Get.back();
          },
        ),
        title: GestureDetector(
          onTap: () => Get.back(),
          child: Text(
            'Kembali',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: Resources.font.primaryFont,
            ),
          ),
        ),
      ),
      backgroundColor: Resources.color.backgroundHome2,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
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
                      fontSize: 26,
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
                          var questionnaire = controller.questionnaires[index];
                          return QuestionnaireCard(
                            title: questionnaire.title!,
                            description: questionnaire.description!,
                            imageUrl: questionnaire.image ?? "",
                            onPressed: () {
                              Get.toNamed('/questionnaire_question',
                                  arguments: {
                                    'id': questionnaire.id,
                                    'image': questionnaire.image ?? '',
                                  });
                            },
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
      ),
    );
  }
}
