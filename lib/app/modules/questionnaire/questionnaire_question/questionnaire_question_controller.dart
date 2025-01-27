import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:mahati_mobile/app/core/data/questionnaire_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/show_bar/show_bar.dart';
import 'package:mahati_mobile/app/utils/token_utils.dart';

class QuestionnaireQuestionController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  final PageController pageController = PageController();

  final RxInt pageLength = 0.obs;
  final RxInt currentPageIndex = 0.obs;
  RxList<QuestionnaireQuestion> questionnaireQuestion =
      RxList<QuestionnaireQuestion>([]);
  RxList<AvailableAnswer> availableAnswer = RxList<AvailableAnswer>([]);
  RxList selectedAnswer = [].obs;

  RxBool isLoading = false.obs;
  RxBool isLastPage = false.obs;

  final token = getToken();

  @override
  onInit() async {
    super.onInit();
    await getQuestionnaires();
  }

  void updatePageIndicator(int index) => currentPageIndex.value = index;

  getQuestionnaires() async {
    final token = await getToken();
    final result = await restClient.requestWithToken(
        '/questionnaire/${Get.arguments['id']}',
        HttpMethod.GET,
        null,
        token.toString());

    if (result.statusCode == 200) {
      final jsonData = result.body;
      final questionnaireResult =
          Questionnaire.fromJson(json.decode(jsonData)['data']);

      questionnaireQuestion.assignAll(questionnaireResult.question);
      pageLength.value = questionnaireResult.question.length;
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${result.statusCode}');
      }
    }
  }

  void nextPage() {
    int pageIndex = currentPageIndex.value + 1;
    pageController.jumpToPage(pageIndex);
    isLastPageCheck();
  }

  void setSelectedAnswer(int questionnaireQuestionId, int answerId) {
    int index = currentPageIndex.value;
    int existingIndex =
        selectedAnswer.indexWhere((element) => element[0] == index);

    if (existingIndex != -1) {
      selectedAnswer[existingIndex] = [
        index,
        questionnaireQuestionId,
        answerId,
      ];
    } else {
      selectedAnswer.add([index, questionnaireQuestionId, answerId]);
    }
  }

  void isLastPageCheck() {
    if (currentPageIndex.value == pageLength.value - 1) {
      isLastPage.value = true;
    } else {
      isLastPage.value = false;
    }
  }

  Future<void> sendData() async {
    final userId = await getUserId();
    final answerData = selectedAnswer.map((answer) {
      return {
        'questionnaireQuestionId': answer[1],
        'answerId': answer[2],
      };
    }).toList();

    QuestioinnaireAnswer questioinnaireAnswer = QuestioinnaireAnswer(
      user_id: userId,
      questionnaireQuestionId: Get.arguments['id'],
      answers: answerData,
    );

    await restClient.request('/questionnaire_question_answer', HttpMethod.POST,
        questioinnaireAnswer.toJson());
    showSuccessMessage("Survey Berhasil di Submit", "Terima kasih");
    Get.offAndToNamed('/questionnaire');
  }
}
