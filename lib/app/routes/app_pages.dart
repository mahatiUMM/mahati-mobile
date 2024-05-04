import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_binding.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_view.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_binding.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/questionnaire_question_binding.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/questionnaire_question_view.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_view.dart';
import 'package:mahati_mobile/app/modules/splash/splash_binding.dart';
import 'package:mahati_mobile/app/modules/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.onboard,
      page: () => const OnboardView(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: _Paths.questionnaire,
      page: () => const QuestionnaireView(),
      binding: QuestionnaireBinding(),
    ),
    GetPage(
      name: _Paths.questionnaireQuestion,
      page: () => const QuestionnaireQuestionView(),
      binding: QuestionnaireQuestionBinding(),
    ),
  ];
}
