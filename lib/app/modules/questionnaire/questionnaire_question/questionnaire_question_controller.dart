import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:mahati_mobile/app/data/models/questionnaire.dart';
import 'package:http/http.dart' as http;

class QuestionnaireQuestionController extends GetxController {
  static const String _baseUrl = 'http://10.0.2.2:3001/api/questionnaire';

  RxList<Questionnaire> questionnaires = RxList<Questionnaire>([]);
  RxBool isLoading = false.obs;

  @override
  onInit() async {
    super.onInit();
    await fetchQuestionnaires();
  }

  Future<void> fetchQuestionnaires() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${_baseUrl}'));
      if (response.statusCode == 200) {
        final jsonData = response.body;
        final questionnaireResult =
            QuestionnaireResult.fromJson(json.decode(jsonData));  
        questionnaires.value = questionnaireResult.questionnaires;
        // print(questionnaireResult);

        questionnaires.value.forEach((questionnaire) {
          // print(questionnaire.title);
          // Print other properties as needed
        });
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
