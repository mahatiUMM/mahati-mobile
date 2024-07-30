import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mahati_mobile/app/modules/home/home_controller.dart';
import 'package:mahati_mobile/app/utils/constants/animation_urls.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

Widget bloodPressureDashboard() {
  final homeController = Get.find<HomeController>();

  return Obx(
    () {
      if (homeController.isDashboardLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Resources.color.primaryColor),
          ),
        );
      } else {
        return SizedBox(
          width: double.infinity, // Ensures the SizedBox takes the full width
          child: Row(
            children: [
              Expanded(
                // Ensures the container takes up available width
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(42.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Stack(
                      children: [
                        Lottie.asset(
                          AnimationUrls.heartAnimation,
                          height: 220,
                          width: 220,
                          repeat: true,
                        ),
                        Positioned(
                          bottom:
                              20, // Adjust this value as needed for your padding
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20), // Horizontal padding if needed
                            child: Text(
                              "Tekanan Darah Normal",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: Resources.font.primaryFont,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Container(
                    width: 45.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 45.w,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE9CC66).withAlpha(140),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              children: [
                                Text(
                                  "Systolic",
                                  style: TextStyle(
                                      fontFamily: Resources.font.primaryFont,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                Text(
                                  homeController.recentSystolic.value,
                                  style: TextStyle(
                                      fontFamily: Resources.font.primaryFont,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ), // Expanded should be outside Container
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 45.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 102, 170, 233)
                                .withAlpha(140),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              children: [
                                Text(
                                  "Diastolic",
                                  style: TextStyle(
                                      fontFamily: Resources.font.primaryFont,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                Text(
                                  homeController.recentDiastole.value,
                                  style: TextStyle(
                                      fontFamily: Resources.font.primaryFont,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ), // Expanded should be outside Container
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 45.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 102, 233, 148)
                                .withAlpha(140),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              children: [
                                Text(
                                  "Pulse",
                                  style: TextStyle(
                                      fontFamily: Resources.font.primaryFont,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                Text(
                                  homeController.recentPulse.value,
                                  style: TextStyle(
                                      fontFamily: Resources.font.primaryFont,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ), // Expanded should be outside Container
                        ),
                      ],
                    ), // Expanded should be outside Container
                  ),
                ],
              ),
            ],
          ),
        );
      }
    },
  );
}
