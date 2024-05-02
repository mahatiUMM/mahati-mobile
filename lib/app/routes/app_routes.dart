part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const onboading = _Paths.onboard;
  static const signin = _Paths.signin;
  static const signup = _Paths.signup;
  static const layout = _Paths.layout;
  static const home = _Paths.home;
  static const inbox = _Paths.inbox;
  static const profile = _Paths.profile;
  static const pressure = _Paths.pressure;
  static const pressureHistory = _Paths.pressureHistory;
  static const education = _Paths.education;
  static const articleDetail = _Paths.articleDetail;
  static const brochureDetail = _Paths.brochureDetail;
}

abstract class _Paths {
  _Paths._();

  static const splash = '/splash';
  static const onboard = '/onboard';
  static const signin = '/signin';
  static const signup = '/signup';
  static const layout = '/layout';
  static const home = '/home';
  static const inbox = '/inbox';
  static const profile = '/profile';
  static const pressure = '/pressure';
  static const pressureHistory = '/pressure/history';
  static const education = '/education';
  static const articleDetail = '/article/detail';
  static const brochureDetail = '/brochure/detail';
}
