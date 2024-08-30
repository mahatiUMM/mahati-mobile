import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/watch/watch_controller.dart';
import 'package:mahati_mobile/app/modules/watch/widget/device_item.dart';
import 'package:mahati_mobile/app/modules/watch/widget/watch_general_options.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

class WatchView extends GetView<WatchController> {
  const WatchView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Resources.color.backgroundHome2,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundHome,
        body: RefreshIndicator(
          color: Resources.color.primaryColor,
          onRefresh: controller.getWatchData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: SizedBox(child: Obx(() {
              if (controller.currentDeviceIds.value.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18, top: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Perangkat Saya",
                              style: TextStyle(
                                color: const Color(0xFF2C3131),
                                fontSize: 24,
                                fontFamily: Resources.font.primaryFont,
                                fontWeight: FontWeight.w600,
                              )),
                          InkWell(
                            onTap: () => controller.startScanning(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Pindai Perangkat",
                                style: TextStyle(
                                  color: Resources.color.primaryColor,
                                  fontFamily: Resources.font.primaryFont,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height - 170,
                      child: Expanded(
                        child: ListView.builder(
                          itemCount: controller.devices.length,
                          itemBuilder: (context, index) => getListItem(
                              controller.devices[index], context, controller),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18, top: 18),
                        child: Text("Perangkat Saya",
                            style: TextStyle(
                              color: const Color(0xFF2C3131),
                              fontSize: 24,
                              fontFamily: Resources.font.primaryFont,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18.0),
                                child: Image.asset(
                                  'assets/images/watch.png',
                                  width: 180,
                                  height: 180,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.currentDeviceName.value,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Resources.color.baseColor,
                                      fontFamily: Resources.font.primaryFont,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    controller.currentDeviceIds.value,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Resources.color.baseColor,
                                      fontFamily: Resources.font.primaryFont,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          controller.currentDeviceBattery.value
                                                  .toString() +
                                              "%",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Resources.color.baseColor,
                                            fontFamily:
                                                Resources.font.primaryFont,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )),
                      watchGeneralSettings(),
                    ]);
              }
            })),
          ),
        ),
      );
    });
  }
}
