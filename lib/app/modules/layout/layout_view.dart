import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/home/home_view.dart';
import 'package:mahati_mobile/app/modules/inbox/inbox_view.dart';
import 'package:mahati_mobile/app/modules/layout/layout_controller.dart';
import 'package:mahati_mobile/app/modules/layout/widget/bottom_navbar.dart';
import 'package:mahati_mobile/app/modules/profile/profile_view.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomeView(),
                InboxView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: SizedBox(
              height: 70,
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
                  landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
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
                      label: 'Inbox',
                    ),
                    bottomNavbar(
                      icon: Icons.person,
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
