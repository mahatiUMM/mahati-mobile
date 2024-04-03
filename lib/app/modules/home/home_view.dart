import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/home/home_controller.dart';
import 'package:mahati_mobile/app/modules/home/widget/bottom_navbar.dart';
import 'package:mahati_mobile/app/modules/home/widget/greeting.dart';
import 'package:mahati_mobile/app/modules/home/widget/slider.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, devicetype) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.backgroundHome,
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                Row(
                  children: [
                    greetingWidget("Rizky Haksono"),
                  ],
                ),
                const SizedBox(height: 20),
                sliderWidget(),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: BottomNavigationBar(
                enableFeedback: true,
                unselectedItemColor: Resources.color.baseColor1,
                selectedItemColor: Resources.color.primaryColor,
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Resources.color.whiteColor,
                selectedLabelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  fontFamily: Resources.font.primaryFont,
                ),
                elevation: 8,
                items: [
                  bottomNavbar(
                    icon: Icons.home_filled,
                    label: 'Home',
                  ),
                  bottomNavbar(
                    icon: Icons.inbox,
                    label: 'Movies',
                  ),
                  bottomNavbar(
                    icon: Icons.person,
                    label: 'Favorites',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
