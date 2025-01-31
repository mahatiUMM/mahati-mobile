import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mahati_mobile/app/core/data/profile_model.dart';
import 'dart:convert';
import 'package:mahati_mobile/app/core/data/questionnaire_model.dart';
import 'package:mahati_mobile/app/core/data/questionnaire_user_answer_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/token_utils.dart';

class QuestionnaireController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  var username = Rx<String>('');

  RxList<Questionnaire> questionnaires = RxList<Questionnaire>([]);
  RxList<QuestionnaireUser> questionnaireUserAlreadyUse =
      <QuestionnaireUser>[].obs;
  int? questionnaireUserId;
  RxBool isLoading = false.obs;

  final token = getToken();

  @override
  void onInit() async {
    super.onInit();
    await getUserProfile();
    await getQuestionnaires();
    await getQuestionnaireUser();
    // getFormattedQuestionnaires();
  }

  Future<void> getUserProfile() async {
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.GET, null, token.toString());
    var responseData = UserModel.fromJson(jsonDecode(result.body));
    username.value = responseData.username;
  }

  getQuestionnaires() async {
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/questionnaire", HttpMethod.GET, null, token.toString());

    if (result.statusCode == 200) {
      final jsonData = result.body;
      final questionnaireResult =
          QuestionnaireResult.fromJson(json.decode(jsonData));
      questionnaires.value = questionnaireResult.questionnaires;
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${result.statusCode}');
      }
    }
  }

  Future<void> getQuestionnaireUser() async {
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/questionnaire_question_answer",
        HttpMethod.GET,
        null,
        token.toString());

    if (result.statusCode == 200) {
      final responseData =
          QuestionnaireUserAnswer.fromJson(json.decode(result.body));

      for (var answer in responseData.data) {
        // Cek apakah kuesioner sudah ditambahkan
        if (!questionnaireUserAlreadyUse
            .any((item) => item.id == answer.question.questionnaire.id)) {
          // Menambahkan data ke dalam list sebagai objek QuestionnaireUser
          questionnaireUserAlreadyUse.add(QuestionnaireUser(
            id: answer.question.questionnaire.id,
            title: answer.question.questionnaire.title,
            image: answer.question.questionnaire.image,
            description: answer.question.questionnaire.description,
          ));
        }
      }
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${result.statusCode}');
        return;
      }
    }
  }
}
