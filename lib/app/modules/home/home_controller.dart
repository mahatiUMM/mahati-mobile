import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/user_dashboard_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/modules/education/education_controller.dart';
import 'package:mahati_mobile/app/modules/layout/layout_controller.dart';
import 'package:mahati_mobile/app/modules/profile/profile_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  final LayoutController layoutController = Get.find<LayoutController>();
  final ProfileController profileController = Get.find<ProfileController>();
  final EducationController educationController =
      Get.find<EducationController>();
  final PageController pageController = PageController();
  final RxInt currentPageIndex = 0.obs;
  var tabIndex = 0;

  RxList<LowerMedicine> lowerMedicine = <LowerMedicine>[].obs;
  RxBool isDashboardLoading = false.obs;
  RxBool recentIsNormal = false.obs;
  RxString remainingMedicine = ''.obs;
  RxString recentSystolic = ''.obs;
  RxString recentDiastole = ''.obs;
  RxString recentPulse = ''.obs;

  @override
  void onInit() {
    getUserDashboard();
    super.onInit();
  }

  void updatePageIndicator(int index) => currentPageIndex.value = index;

  void dotNavigatorClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> getUserDashboard() async {
    isDashboardLoading.value = true;
    profileController.getUserProfile();
    final token = await getToken();
    final restClient = Get.find<RestClient>();
    final result = await restClient.requestWithToken(
        "/dashboard", HttpMethod.GET, null, token.toString());

    if (result.statusCode == 200) {
      var responseData = UserDashboard.fromJson(jsonDecode(result.body));
      remainingMedicine.value = responseData.data.remainingMedicine.toString();
      lowerMedicine.value = responseData.data.lowerMedicine;
      recentSystolic.value =
          responseData.data.recentBloodPressure.sistol.toString();
      recentDiastole.value =
          responseData.data.recentBloodPressure.diastole.toString();
      recentPulse.value =
          responseData.data.recentBloodPressure.heartbeat.toString();
      recentIsNormal.value =
          responseData.data.recentBloodPressure.sistol < 120 &&
              responseData.data.recentBloodPressure.diastole < 80;
    }
    isDashboardLoading.value = false;
  }
}
