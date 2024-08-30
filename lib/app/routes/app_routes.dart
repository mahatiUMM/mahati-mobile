part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const onboading = _Paths.onboard;
  static const signin = _Paths.signin;
  static const signup = _Paths.signup;
  static const layout = _Paths.layout;
  static const home = _Paths.home;
  static const watch = _Paths.watch;
  static const watchDashboard = _Paths.watchDashboard;
  static const inbox = _Paths.inbox;
  static const profile = _Paths.profile;
  static const profileEdit = _Paths.profileEdit;
  static const setting = _Paths.setting;
  static const pressure = _Paths.pressure;
  static const reminder = _Paths.reminder;
  static const reminderEdit = _Paths.reminderEdit;
  static const reminderDetail = _Paths.reminderDetail;
  static const reminderRefill = _Paths.reminderRefiil;
  static const reminderAction = _Paths.reminderAction;
  static const pressureHistory = _Paths.pressureHistory;
  static const education = _Paths.education;
  static const articleDetail = _Paths.articleDetail;
  static const brochureDetail = _Paths.brochureDetail;
  static const questionnaire = _Paths.questionnaire;
  static const questionnaireQuestion = _Paths.questionnaireQuestion;
}

abstract class _Paths {
  _Paths._();

  static const splash = '/splash';
  static const onboard = '/onboard';
  static const signin = '/signin';
  static const signup = '/signup';
  static const layout = '/layout';
  static const home = '/home';
  static const watch = '/watch';
  static const watchDashboard = '/watch/dashboard';
  static const inbox = '/inbox';
  static const profile = '/profile';
  static const profileEdit = '/profile/edit';
  static const setting = '/setting';
  static const pressure = '/pressure';
  static const reminder = '/reminder';
  static const reminderEdit = '/reminder/edit';
  static const reminderDetail = '/reminder/detail';
  static const reminderRefiil = '/reminder/refill';
  static const reminderAction = '/reminder/action';
  static const pressureHistory = '/pressure/history';
  static const education = '/education';
  static const articleDetail = '/article/detail';
  static const brochureDetail = '/brochure/detail';
  static const questionnaire = '/questionnaire';
  static const questionnaireQuestion = '/questionnaire_question';
}
