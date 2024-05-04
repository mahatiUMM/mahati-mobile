part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const onboading = _Paths.onboard;
  static const home = _Paths.home;
  static const questionnaire = _Paths.questionnaire;
  static const questionnaireQuestion = _Paths.questionnaireQuestion;
}

abstract class _Paths {
  _Paths._();

  static const splash = '/splash';
  static const onboard = '/onboard';
  static const home = '/home';
  static const questionnaire = '/questionnaire';
  static const questionnaireQuestion = '/questionnaire_question';
}
