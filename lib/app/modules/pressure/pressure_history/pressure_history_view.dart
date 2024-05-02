import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/pressure/pressure_history/pressure_history_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class PressureHistoryView extends GetView<PressureHistoryController> {
  const PressureHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundHome,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
              ),
              onPressed: () {
                // Add your action here
              },
            ),
          ],
          elevation: 0,
          leadingWidth: 20,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text(
            'Lacak Tekanan Darah',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Resources.color.primaryColor,
            labelColor: Colors.black,
            overlayColor: MaterialStateColor.resolveWith(
              (states) => Colors.transparent,
            ),
            controller: controller.tabController,
            tabs: controller.myTabs,
          ),
        ),
        body: TabBarView(controller: controller.tabController, children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  // () => Text(
                  //   controller.pressureHistory.value.toString(),
                  // ),
                  () => Column(
                    children: controller.pressureHistory.value
                        .map((e) => Text(e.toString()))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          const SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("2")],
            ),
          )
        ]));
  }
}
