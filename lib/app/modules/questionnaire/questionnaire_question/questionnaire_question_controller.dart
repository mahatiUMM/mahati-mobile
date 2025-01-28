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
  final ScrollController indicatorScrollController = ScrollController();

  late final FocusNode focusNode;

  final RxInt pageLength = 0.obs;
  final RxInt currentPageIndex = 0.obs;
  RxList<QuestionnaireQuestion> questionnaireQuestion =
      RxList<QuestionnaireQuestion>([]);
  RxList<AvailableAnswer> availableAnswer = RxList<AvailableAnswer>([]);
  RxList selectedAnswer = [].obs;

  RxBool isAnswerd = false.obs;
  RxBool isLoading = false.obs;
  RxBool isLastPage = false.obs;
  RxBool isStart = true.obs;

  final token = getToken();

  @override
  onInit() async {
    await getQuestionnaires();
    focusNode = FocusNode();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNode.dispose();
    pageController.dispose();
    indicatorScrollController.dispose();
    super.dispose();
  }

  void startPage(){
    pageController.jumpToPage(0);
  }

  void nextPage() {
    int pageIndex = currentPageIndex.value + 1;
    pageController.jumpToPage(pageIndex);
    isAnswerd.value = false;
    isLastPageCheck();
  }

  void updatePageIndicator(int index) {
    const double dotWidth = 15.0; // Same as in the view
    final double scrollTo =
        (index * dotWidth) - (Get.width * 0.5 - dotWidth * 7.5);
    if (indicatorScrollController.hasClients) {
      if (index > 6 && index < pageLength.value - 4) {
        indicatorScrollController.animateTo(
          scrollTo,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {}
      currentPageIndex.value = index;
    }
  }

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

  var selectedOption = RxnInt();

  void setSelectedOption(int? value) {
    selectedOption.value = value;
  }

  void handleNext() {
    // Handle next action here
    if (selectedOption.value != null) {
      // Process the answer
      print('Selected option: ${selectedOption.value}');
      // Navigate to next question or submit
    }
  }
}
