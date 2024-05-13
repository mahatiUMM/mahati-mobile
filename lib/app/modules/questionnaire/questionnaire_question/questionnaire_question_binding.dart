import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/questionnaire_question_controller.dart';

class QuestionnaireQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestionnaireQuestionController());
    Get.lazyPut(() => RestClient());
  }
}
