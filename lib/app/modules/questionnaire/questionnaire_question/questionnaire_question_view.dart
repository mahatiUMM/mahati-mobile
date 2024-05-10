import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/core/data/questionnaire_model.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/questionnaire_question_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/widget/questionnaire_answer_card.dart';

class QuestionnaireQuestionView
    extends GetView<QuestionnaireQuestionController> {
  const QuestionnaireQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the questionnaire data using Get.arguments
    final Questionnaire questionnaire = Get.arguments['questionnaire'];
    final List<QuestionnaireQuestion> questionnaireQuestionList =
        Get.arguments['questionnaire_questions'];

    // Now you can use the questionnaire object to access its properties
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        title: const Text('Kembali'),
        centerTitle: false,
        titleSpacing: 0.0,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert_rounded),
          )
        ],
      ),
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
              child: Image.network(
                questionnaire.image!,
                height: 260,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Card(
                color: Color(0xFFFFFFFF),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 540,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                  ),
                  items: questionnaireQuestionList.map((question) {
                    // Replace SizedBox() with your actual widget that displays the question
                    return SizedBox(
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 28.0, left: 28, right: 28),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(question.question ?? '',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
                                  child: Text(
                                    "Jawablah Dengan Jujur",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          QuestionnaireAnswerCard()
                        ],
                      ),
                    );
                  }).toList(), // Convert the mapped iterable to a list of widgets
                ),
              ),
            )
            // Text(
            //   'Questionnaire Title: ${questionnaire.title}',
            //   style: TextStyle(fontSize: 20),
            // ),
            // SizedBox(height: 20),
            // Text(
            //   'Questionnaire Description: ${questionnaire.description}',
            //   style: TextStyle(fontSize: 20),
            // ),
            // Add more widgets to display other questionnaire data
          ],
        ),
      ),
    );
  }
}
