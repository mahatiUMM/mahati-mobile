import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_controller.dart';

class QuestionnaireBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestionnaireController());
    Get.lazyPut(() => RestClient());
  }
}
