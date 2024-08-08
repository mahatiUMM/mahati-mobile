import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/home/home_controller.dart';
import 'package:mahati_mobile/app/modules/home/widget/blood_pressure_dashboard.dart';
import 'package:mahati_mobile/app/modules/home/widget/reminder_dashboard.dart';
import 'package:sizer/sizer.dart';

class SliderWidget extends StatelessWidget {
  SliderWidget({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return SizedBox(
          height: 200,
          width: Get.width,
          child: PageView(
            controller: homeController.pageController,
            onPageChanged: homeController.updatePageIndicator,
            physics: const BouncingScrollPhysics(),
            children: [bloodPressureDashboard(), reminderDashboard()],
          ),
        );
      },
    );
  }
}
