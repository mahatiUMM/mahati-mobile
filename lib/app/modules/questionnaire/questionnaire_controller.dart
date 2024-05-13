import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/profile_model.dart';
import 'dart:convert';
import 'package:mahati_mobile/app/core/data/questionnaire_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionnaireController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  var username = Rx<String>('');

  RxList<Questionnaire> questionnaires = RxList<Questionnaire>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserProfile();
    await getQuestionnaires();
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
}
