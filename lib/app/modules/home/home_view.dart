import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/home/home_controller.dart';
import 'package:mahati_mobile/app/modules/home/widget/greeting.dart';
import 'package:mahati_mobile/app/modules/home/widget/slider.dart';
import 'package:mahati_mobile/app/modules/home/widget/tab_box.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:mahati_mobile/app/modules/education/article/article_list_card.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Resources.color.backgroundHome2,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Sizer(
      builder: (context, orientation, devicetype) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.backgroundHome,
          body: RefreshIndicator(
            color: Resources.color.primaryColor,
            onRefresh: controller.getUserDashboard,
            child: SingleChildScrollView(
              child: SizedBox(
                width: Get.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => GreetingWidget(
                            username: controller.username.value,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SliderWidget(),
                    const SizedBox(height: 20),
                    const TabBox(),
                    const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Text("Recent Articles",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            ArticleListCard(
                                thumbnailUrl:
                                    "https://img-cdn.medkomtek.com/gI3-RXYeVSRgdvop2RYA_KWWIho=/0x0/smart/filters:quality(100):format(webp)/article/0FJ_hujLjhAi-JVfStt3w/original/xtqwarxi81g1f9z4eti38wq5ba28z0gc.png",
                                title: "Diabetes",
                                summary: "Gejala, Diagnosis & Cara Pengobatan"),
                            ArticleListCard(
                                thumbnailUrl:
                                    "https://img-cdn.medkomtek.com/gI3-RXYeVSRgdvop2RYA_KWWIho=/0x0/smart/filters:quality(100):format(webp)/article/0FJ_hujLjhAi-JVfStt3w/original/xtqwarxi81g1f9z4eti38wq5ba28z0gc.png",
                                title: "Diabetes",
                                summary: "Gejala, Diagnosis & Cara Pengobatan"),
                            ArticleListCard(
                                thumbnailUrl:
                                    "https://img-cdn.medkomtek.com/gI3-RXYeVSRgdvop2RYA_KWWIho=/0x0/smart/filters:quality(100):format(webp)/article/0FJ_hujLjhAi-JVfStt3w/original/xtqwarxi81g1f9z4eti38wq5ba28z0gc.png",
                                title: "Diabetes",
                                summary: "Gejala, Diagnosis & Cara Pengobatan"),
                          ]),
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
