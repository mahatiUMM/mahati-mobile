part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const onboading = _Paths.onboard;
  static const signin = _Paths.signin;
  static const signup = _Paths.signup;
  static const home = _Paths.home;
}

abstract class _Paths {
  _Paths._();

  static const splash = '/splash';
  static const onboard = '/onboard';
  static const signin = '/signin';
  static const signup = '/signup';
  static const home = '/home';
}
