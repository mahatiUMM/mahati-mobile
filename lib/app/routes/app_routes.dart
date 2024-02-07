part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const onboading = _Paths.onboarding;
  static const home = _Paths.home;
}

abstract class _Paths {
  _Paths._();

  static const splash = '/splash';
  static const onboarding = '/onboard';
  static const home = '/home';
}
