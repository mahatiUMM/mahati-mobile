import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/video/widget/video_list_card.dart';
import 'package:mahati_mobile/app/modules/home/home_controller.dart';
import 'package:mahati_mobile/app/modules/home/widget/greeting.dart';
import 'package:mahati_mobile/app/modules/home/widget/slider.dart';
import 'package:mahati_mobile/app/modules/home/widget/tab_box.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            onRefresh: controller.getAllDashboard,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
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
                    SliderWidget(),
                    const SizedBox(height: 20),
                    SmoothPageIndicator(
                      controller: controller.pageController,
                      onDotClicked: (index) =>
                          controller.dotNavigatorClick(index),
                      effect: const ScrollingDotsEffect(
                        dotHeight: 4,
                        activeDotColor: Color(0xFF40D99E),
                      ),
                      count: 2,
                    ),
                    const SizedBox(height: 20),
                    const TabBox(),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Text("Edukasi Terbaru",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Obx(
                              () {
                                if (controller.isEducationLoading.value) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Resources.color.primaryColor),
                                    ),
                                  );
                                } else {
                                  return SizedBox(
                                    height: null,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            controller.educationVideos.length,
                                        itemBuilder: (context, index) {
                                          final video =
                                              controller.educationVideos[index];
                                          return VideoListCard(
                                            id: video.id,
                                            thumbnailUrl: video.thumbnailUrl,
                                            title: video.title,
                                            summary: video.authorName,
                                            youtubeUrl: video.link,
                                            isBookmarked: video.isBookmarked,
                                          );
                                        }),
                                  );
                                }
                              },
                            )
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
