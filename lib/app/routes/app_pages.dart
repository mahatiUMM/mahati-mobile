import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/auth/sign_in/signin_binding.dart';
import 'package:mahati_mobile/app/modules/auth/sign_in/signin_view.dart';
import 'package:mahati_mobile/app/modules/auth/sign_up/signup_binding.dart';
import 'package:mahati_mobile/app/modules/auth/sign_up/signup_view.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_binding.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_view.dart';
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
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.onboard,
      page: () => const OnboardView(),
      binding: OnboardBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.signin,
      page: () => const SignInView(),
      binding: SignInBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.signup,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    )
  ];
}
