import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:mahati_mobile/app/core/data/questionnaire_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionnaireQuestionController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();

  RxList<Questionnaire> questionnaires = RxList<Questionnaire>([]);
  RxBool isLoading = false.obs;

  @override
  onInit() async {
    super.onInit();
    // await fetchQuestionnaires();
    await getQuestionnaires();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  getQuestionnaires() async {
    final token = await getToken();
    final result = await restClient.requestWithToken(
        "/questionnaire", HttpMethod.GET, null, token.toString());

    print(result.body);

    if (result.statusCode == 200) {
      final jsonData = result.body;
      final questionnaireResult =
          QuestionnaireResult.fromJson(json.decode(jsonData));
      questionnaires.value = questionnaireResult.questionnaires;
      print(questionnaires);
      for (var questionnaire in questionnaires) {
        for (var element in questionnaire.question) {
          print(element.question);
        }
        print(questionnaire.title);
      }
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${result.statusCode}');
      }
    }
  }

  // Future<void> fetchQuestionnaires() async {
  //   try {
  //     isLoading.value = true;
  //     final response = await http.get(Uri.parse('${_baseUrl}'));
  //     if (response.statusCode == 200) {
  //       final jsonData = response.body;
  //       final questionnaireResult =
  //           QuestionnaireResult.fromJson(json.decode(jsonData));
  //       questionnaires.value = questionnaireResult.questionnaires;
  //       // print(questionnaireResult);

  //       questionnaires.value.forEach((questionnaire) {
  //         // print(questionnaire.title);
  //         // Print other properties as needed
  //       });
  //     } else {
  //       if (kDebugMode) {
  //         print('Request failed with status: ${response.statusCode}');
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('An error occurred: $e');
  //     }
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
