import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/profile_model.dart';
import 'dart:convert';
import 'package:mahati_mobile/app/core/data/questionnaire_model.dart';
import 'package:mahati_mobile/app/core/data/questionnaire_user_answer_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/token_utils.dart';

class QuestionnaireController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  var username = Rx<String>('');
  RxList<Map<int, bool>> isFilled = <Map<int, bool>>[].obs;

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
  }

  @override
  void dispose() {
    getQuestionnaireUser();
    getQuestionnaires();
    super.dispose();
  }

  Future<void> getUserProfile() async {
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.GET, null, token.toString());
    var responseData = UserModel.fromJson(jsonDecode(result.body));
    username.value = responseData.username;
  }

  getQuestionnaires() async {
    isLoading.value = true;
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/questionnaire", HttpMethod.GET, null, token.toString());

    if (result.statusCode == 200) {
      isLoading.value = false;
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
    isLoading.value = true;
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/questionnaire_question_answer",
        HttpMethod.GET,
        null,
        token.toString());

    if (result.statusCode == 200) {
      isLoading.value = false;
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
      for (var questionnaire in questionnaires) {
        if (questionnaire.id != null) {
          bool exists = questionnaireUserAlreadyUse.any(
              (userQuestionnaire) => userQuestionnaire.id == questionnaire.id);

          // Menyimpan hasil ke dalam isFilled
          isFilled.add({
            questionnaire.id!: exists
          }); // Gunakan ! untuk mengakses nilai non-null
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
