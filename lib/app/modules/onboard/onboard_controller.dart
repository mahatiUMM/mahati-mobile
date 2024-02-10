import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/login/login_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // page controller
  final pageController = PageController();

  // initial page index
  Rx<int> currentPageIndex = 0.obs;

  // update the page indicator
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // jump to specific page, display dot on selected page
  void dotNavigatorClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // update the current index, jump to next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      // navigate to login screen
      Get.to(() => const LoginScreen());
    } else {
      int pageIndex = currentPageIndex.value + 1;
      pageController.jumpToPage(pageIndex);
    }
  }

  // jump to the last page, when the skip button in pressed
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
