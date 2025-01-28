import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_controller.dart';
import 'package:mahati_mobile/app/modules/questionnaire/widget/questionnaire_card.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

import 'widget/questionnaire_available.dart';

class QuestionnaireView extends GetView<QuestionnaireController> {
  const QuestionnaireView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            bottom: TabBar(
                splashFactory: NoSplash.splashFactory,
                labelColor: Resources.color.titleColor,
                indicatorColor: Resources.color.primaryColor,
                tabs: [
                  Text(
                    "Kuesioner",
                    style: TextStyle(
                        fontFamily: Resources.font.primaryFont, fontSize: 14),
                  ),
                  Text(
                    "Riwayat kuesioner",
                    style: TextStyle(
                        fontFamily: Resources.font.primaryFont, fontSize: 14),
                  )
                ]),
          ),
          backgroundColor: Resources.color.backgroundHome2,
          body: TabBarView(children: [
            QuestionnaireAvailable(controller: controller),
            QuestionnaireAvailable(controller: controller)
          ])),
    );
  }
}


