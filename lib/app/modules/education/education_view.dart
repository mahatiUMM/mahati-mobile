import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/education_controller.dart';
import 'package:mahati_mobile/app/modules/education/widget/education_tab.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class EducationView extends GetView<EducationController> {
  const EducationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Kembali',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edukasi',
              style: TextStyle(
                color: const Color(0xFF2C3131),
                fontSize: 24,
                fontFamily: Resources.font.primaryFont,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        final educationTab = controller.educationTab[index];
                        return GestureDetector(
                          onTap: () {
                            controller.handleTabSelection(index);
                          },
                          child: EducationTab(
                            tabName: educationTab,
                            isSelected: controller.selectedIndex == index,
                          ),
                        );
                      });
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
