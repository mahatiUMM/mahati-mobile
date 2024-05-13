import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/profile/profile_controller.dart';
import 'package:mahati_mobile/app/modules/profile/widget/image_picker.dart';
import 'package:mahati_mobile/app/utils/constants/text_style.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Resources.color.whiteColor,
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height / 3,
                    decoration: ShapeDecoration(
                      color: Resources.color.whiteColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32)),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 2.h,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    )),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 0),
                            width: Get.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() {
                                  return Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 70,
                                        backgroundColor: Colors.grey[200],
                                        backgroundImage: controller
                                                    .image.value !=
                                                null
                                            ? FileImage(controller.image.value!)
                                            : null,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: -10,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, right: 5.0),
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.camera,
                                              size: 36,
                                            ),
                                            onPressed: () => showImagePicker(
                                              context,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => SizedBox(
                                        width: Get.width / 2,
                                        child: Text(
                                          controller.username.value,
                                          style: StyleText.homeGreeting3,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    SizedBox(
                                      width: Get.width / 2,
                                      child: Text(
                                        "Designer",
                                        style: StyleText.homeGreeting4,
                                      ),
                                    ),
                                    SizedBox(height: 1.h),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed("/profile/edit");
                                      },
                                      child: Text(
                                        "Edit Profile",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Resources.color.subtitleColor,
                                          fontSize: 12.sp,
                                          fontFamily:
                                              Resources.font.primaryFont,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
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
                            Text("Video Yang disimpan: ",
                                style: StyleText.homeGreeting1),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Color(0xFF2C3131)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                ),
                                onPressed: () {
                                  print('export');
                                },
                                child: Text(
                                  "Export",
                                  style: TextStyle(
                                    color: Resources.color.whiteColor,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                            height: Get.height / 2.06,
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12.0,
                                      mainAxisSpacing: 12.0),
                              itemCount: controller.gridMap.length,
                              itemBuilder: (_, index) {
                                return Card(
                                  elevation: 0,
                                  color: Resources.color.whiteColor,
                                  child: Center(
                                    child: Stack(children: [
                                      const Positioned(
                                        right: 0,
                                        child: Icon(Icons.bookmark),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          SizedBox(
                                            width: 32.w,
                                            height: 48,
                                            child: Text(
                                              '${controller.gridMap.elementAt(index)['title']}',
                                              style: StyleText.cardTitle1,
                                              maxLines: 2,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          SizedBox(
                                            width: 32.w,
                                            height: 80,
                                            child: Text(
                                              '${controller.gridMap.elementAt(index)['subtitle']}',
                                              style: StyleText.cardSubTitle1,
                                              maxLines: 3,
                                            ),
                                          )
                                        ],
                                      ),
                                    ]),
                                  ),
                                );
                              },
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
