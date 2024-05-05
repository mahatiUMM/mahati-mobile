import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_controller.dart';

class QuestionnaireBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(QuestionnaireController());
    Get.lazyPut<QuestionnaireController>(() => QuestionnaireController());
  }
}
