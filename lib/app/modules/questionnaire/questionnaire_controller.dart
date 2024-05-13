import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/profile_model.dart';
import 'dart:convert';
import 'package:mahati_mobile/app/core/data/questionnaire_model.dart';
import 'package:http/http.dart' as http;
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionnaireController extends GetxController {
  late RestClient restClient;
  // DO NOT USE THIS IN PRODUCTION
  static const String _baseUrl = 'http://10.0.2.2:3001/api/questionnaire';
  var username = Rx<String>('');

  RxList<Questionnaire> questionnaires = RxList<Questionnaire>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserProfile();
    // await fetchQuestionnaires();
    // await getQuestionnaires();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> getUserProfile() async {
    final token = await getToken();
    final restClient = Get.find<RestClient>();
    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.GET, null, token.toString());
    var responseData = UserModel.fromJson(jsonDecode(result.body));
    username.value = responseData.username;
  }

  getQuestionnaires() async {
    final result =
        await restClient.request("/questionnaire", HttpMethod.GET, null);

    if (result.statusCode == 304) {
      final jsonData = result.body;
      final questionnaireResult =
          QuestionnaireResult.fromJson(json.decode(jsonData));
      questionnaires.value = questionnaireResult.questionnaires;
      // print(questionnaires.value);
      questionnaires.value.forEach((questionnaire) {
        questionnaire.question.forEach((element) {
          // print(element.question);
        });
        // print(questionnaire.title);
        // Print other properties as needed
      });
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${result.statusCode}');
      }
    }
  }

  // TODO: avoid using url directly in the controller
  Future<void> fetchQuestionnaires() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${_baseUrl}'));
      if (response.statusCode == 200) {
        final jsonData = response.body;
        final questionnaireResult =
            QuestionnaireResult.fromJson(json.decode(jsonData));
        questionnaires.value = questionnaireResult.questionnaires;
        // print(questionnaires.value);
        questionnaires.value.forEach((questionnaire) {
          questionnaire.question.forEach((element) {
            // print(element.question);
          });
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
