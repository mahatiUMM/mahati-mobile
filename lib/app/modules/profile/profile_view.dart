import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/profile/profile_controller.dart';
import 'package:mahati_mobile/app/utils/constants/text_style.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Resources.color.backgroundHome2,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return Sizer(builder: (context, orientation, devicetype) {
      return Scaffold(
        backgroundColor: AppColors.backgroundHome,
        body: SafeArea(
          child: Container(
            width: Get.width,
            color: const Color(0xFFF9F9F9),
            child: RefreshIndicator(
              color: Resources.color.primaryColor,
              onRefresh: controller.fetchProfile,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      decoration: ShapeDecoration(
                        color: Resources.color.whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 2.h,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: Get.height / 18,
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.w),
                                        child: Text(
                                          'Profil Saya',
                                          textAlign: TextAlign.center,
                                          style: StyleText.homeGreeting1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height / 18,
                                    child: IconButton(
                                      onPressed: () {
                                        Get.toNamed("/setting");
                                      },
                                      icon: Icon(
                                        Icons.settings_outlined,
                                        color: Resources.color.baseColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 24),
                              width: Get.width,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Obx(() => CircleAvatar(
                                          radius: 62,
                                          backgroundColor: Colors.grey[200],
                                          child: controller
                                                  .photo.value.isNotEmpty
                                              ? CachedNetworkImage(
                                                  imageUrl:
                                                      'https://mahati.xyzuan.my.id/${controller.photo.value}',
                                                  placeholder: (context, url) =>
                                                      const CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          const Icon(
                                                    Icons.error,
                                                    color: Colors.red,
                                                    size: 40,
                                                  ),
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      CircleAvatar(
                                                    radius: 70,
                                                    backgroundColor:
                                                        Colors.grey[200],
                                                    backgroundImage:
                                                        imageProvider,
                                                  ),
                                                )
                                              : CircleAvatar(
                                                  radius: 70,
                                                  backgroundColor:
                                                      Colors.grey[200],
                                                ),
                                        )),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Obx(
                                        () => SizedBox(
                                          width: Get.width / 2,
                                          child: Text(
                                            controller.username.value,
                                            textAlign: TextAlign.center,
                                            style: StyleText.homeGreeting3,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      Obx(
                                        () => SizedBox(
                                          width: Get.width / 2,
                                          child: Text(
                                            controller.email.value,
                                            textAlign: TextAlign.center,
                                            style: StyleText.homeGreeting4,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          elevation:
                                              const MaterialStatePropertyAll(0),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Resources.color.backgroundHome2,
                                          ),
                                          shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                              side: BorderSide(
                                                color:
                                                    Resources.color.baseColor,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(99),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.toNamed("/profile/edit");
                                        },
                                        child: Text(
                                          "Edit Profil",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily:
                                                Resources.font.primaryFont,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 3.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Video yang disimpan",
                                style: StyleText.homeGreeting3,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                    Color(0xFF2C3131),
                                  ),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(99),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  controller.exportUserVideos();
                                },
                                child: Text(
                                  "Export",
                                  style: TextStyle(
                                    color: Resources.color.whiteColor,
                                    fontFamily: Resources.font.primaryFont,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Obx(
                            () => SizedBox(
                              height: null,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 2.w,
                                  mainAxisSpacing: 2.h,
                                  childAspectRatio:
                                      (Get.width / 2) / (Get.height / 4.5),
                                ),
                                itemCount: controller.educationVideos.length,
                                itemBuilder: (_, index) {
                                  return Card(
                                    elevation: 0,
                                    color: Resources.color.whiteColor,
                                    child: Center(
                                      child: Stack(
                                        children: [
                                          const Positioned(
                                            right: 0,
                                            child: Icon(Icons.bookmark),
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(height: 4.h),
                                              SizedBox(
                                                width: 32.w,
                                                height: 48,
                                                child: Text(
                                                  controller
                                                      .educationVideos[index]
                                                      .title,
                                                  style: StyleText.cardTitle1,
                                                  maxLines: 2,
                                                ),
                                              ),
                                              SizedBox(height: 1.h),
                                              SizedBox(
                                                width: 32.w,
                                                height: 5.h,
                                                child: Text(
                                                  controller
                                                      .educationVideos[index]
                                                      .authorName,
                                                  style:
                                                      StyleText.cardSubTitle1,
                                                  maxLines: 3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
