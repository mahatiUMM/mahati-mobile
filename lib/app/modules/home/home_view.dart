import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/home/home_controller.dart';
import 'package:mahati_mobile/app/modules/home/widget/greeting.dart';
import 'package:mahati_mobile/app/modules/home/widget/slider.dart';
import 'package:mahati_mobile/app/modules/home/widget/tab_box.dart';
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
          body: SingleChildScrollView(
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
        );
      },
    );
  }
}
