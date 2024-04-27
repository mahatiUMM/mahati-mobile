import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/home/home_controller.dart';
import 'package:mahati_mobile/app/modules/home/widget/greeting.dart';
import 'package:mahati_mobile/app/modules/home/widget/slider.dart';
import 'package:mahati_mobile/app/modules/home/widget/tab_box.dart';
import 'package:mahati_mobile/app/utils/Colors/color_app.dart';
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
          body: BottomBar(
              width: 70.w,
              barColor: Colors.white,
              borderRadius: BorderRadius.circular(30),
              body: (context, controller) => SingleChildScrollView(
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height,
                      child: const Column(
                        children: [
                          Row(
                            children: [
                              GreetingWidget(
                                /*
                          ! Change the username value from API MAHATI
                          */
                                username: 'Rizky Haksono',
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SliderWidget(),
                          SizedBox(height: 20),
                          TabBox(),
                        ],
                      ),
                    ),
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      print("Item 1");
                    },
                    icon: Icon(
                      Icons.home_outlined,
                      color: ColorApp.primaryColor1,
                      size: 24,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      print("item 2");
                    },
                    icon: Icon(
                      Icons.inbox_outlined,
                      color: ColorApp.baseColor,
                      size: 24,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      print("item 3");
                    },
                    icon: Icon(
                      Icons.person_outline,
                      color: ColorApp.baseColor,
                      size: 24,
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
