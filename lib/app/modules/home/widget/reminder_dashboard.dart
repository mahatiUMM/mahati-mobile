import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/home/home_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

Widget reminderDashboard() {
  final homeController = Get.find<HomeController>();

  return Obx(
    () {
      if (homeController.isDashboardLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Resources.color.primaryColor),
          ),
        );
      } else {
        return SizedBox(
          width: double.infinity, // Ensures the SizedBox takes the full width
          child: Row(
            children: [
              Expanded(
                // Ensures the container takes up available width
                child: Container(
                  decoration: BoxDecoration(
                    color: Resources.color.secondaryColor3,
                    borderRadius: BorderRadius.circular(52.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Obat Belum diminum Hari Ini",
                          style: TextStyle(
                              color: Colors.red.shade900,
                              fontFamily: Resources.font.primaryFont,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          homeController.remainingMedicine.value,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: 62,
                              fontFamily: Resources.font.primaryFont,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      "Sisa Obat Anda",
                      style: TextStyle(
                          fontFamily: Resources.font.primaryFont,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: 45.w,
                    decoration: BoxDecoration(
                      color: Resources.color.tertiaryColor3,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: null,
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: homeController.lowerMedicine.length,
                                itemBuilder: ((context, index) {
                                  final medicine =
                                      homeController.lowerMedicine[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            medicine.medicineName,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily:
                                                    Resources.font.primaryFont,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Spacer(),
                                          Text(
                                              medicine.medicineTotal.toString())
                                        ],
                                      )
                                    ],
                                  );
                                })),
                          )
                        ],
                      ),
                    ), // Expanded should be outside Container
                  ),
                ],
              ),
            ],
          ),
        );
      }
    },
  );
}
