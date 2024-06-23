import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/auth/sign_in/signin_binding.dart';
import 'package:mahati_mobile/app/modules/auth/sign_in/signin_view.dart';
import 'package:mahati_mobile/app/modules/auth/sign_up/signup_binding.dart';
import 'package:mahati_mobile/app/modules/auth/sign_up/signup_view.dart';
import 'package:mahati_mobile/app/modules/education/article/article_detail/article_detail_binding.dart';
import 'package:mahati_mobile/app/modules/education/article/article_detail/article_detail_view.dart';
import 'package:mahati_mobile/app/modules/education/brochure/brochure_detail/brochure_detail_view.dart';
import 'package:mahati_mobile/app/modules/education/education_binding.dart';
import 'package:mahati_mobile/app/modules/education/education_view.dart';
import 'package:mahati_mobile/app/modules/home/home_binding.dart';
import 'package:mahati_mobile/app/modules/home/home_view.dart';
import 'package:mahati_mobile/app/modules/inbox/inbox_binding.dart';
import 'package:mahati_mobile/app/modules/inbox/inbox_view.dart';
import 'package:mahati_mobile/app/modules/layout/layout_binding.dart';
import 'package:mahati_mobile/app/modules/layout/layout_view.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_binding.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_view.dart';
import 'package:mahati_mobile/app/modules/pressure/pressure_binding.dart';
import 'package:mahati_mobile/app/modules/pressure/pressure_history/pressure_history_binding.dart';
import 'package:mahati_mobile/app/modules/pressure/pressure_history/pressure_history_view.dart';
import 'package:mahati_mobile/app/modules/pressure/pressure_view.dart';
import 'package:mahati_mobile/app/modules/profile/profile_binding.dart';
import 'package:mahati_mobile/app/modules/profile/profile_edit/profile_edit_binding.dart';
import 'package:mahati_mobile/app/modules/profile/profile_edit/profile_edit_view.dart';
import 'package:mahati_mobile/app/modules/profile/profile_view.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_binding.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_detail/reminder_detail_binding.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_detail/reminder_detail_view.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_edit/reminder_edit_binding.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_edit/reminder_edit_view.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refiil/reminder_refill_binding.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refiil/reminder_refill_view.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_view.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_binding.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/questionnaire_question_binding.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_question/questionnaire_question_view.dart';
import 'package:mahati_mobile/app/modules/questionnaire/questionnaire_view.dart';
import 'package:mahati_mobile/app/modules/setting/setting_binding.dart';
import 'package:mahati_mobile/app/modules/setting/setting_view.dart';
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
    ),
    GetPage(
      name: _Paths.layout,
      page: () => const LayoutView(),
      binding: LayoutBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.inbox,
      page: () => const InboxView(),
      binding: InboxBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.profileEdit,
      page: () => ProfileEditView(),
      binding: ProfileEditBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.setting,
      page: () => SettingView(),
      binding: SettingBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.reminder,
      page: () => ReminderView(),
      binding: ReminderBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.reminderEdit,
      page: () => ReminderEditView(),
      binding: ReminderEditBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.reminderDetail,
      page: () => ReminderDetailView(),
      binding: ReminderDetailBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.reminderRefiil,
      page: () => ReminderRefillView(),
      binding: ReminderRefillBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.pressure,
      page: () => PressureView(),
      binding: PressureBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.pressureHistory,
      page: () => const PressureHistoryView(),
      binding: PressureHistoryBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.education,
      page: () => EducationView(),
      binding: EducationBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.articleDetail,
      page: () => ArticleDetailView(),
      binding: ArticleDetailBinding(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.brochureDetail,
      page: () => BrochureDetailView(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.questionnaire,
      page: () => const QuestionnaireView(),
      binding: QuestionnaireBinding(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: _Paths.questionnaireQuestion,
      page: () => const QuestionnaireQuestionView(),
      binding: QuestionnaireQuestionBinding(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
