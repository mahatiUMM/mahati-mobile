import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class InboxView extends GetView {
  const InboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundHome,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Kotak Pesan",
                  style: TextStyle(
                    fontSize: 24,
                    color: Resources.color.baseColor,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("Baca Semua Pesan");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Baca Semua",
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
            const SizedBox(height: 10),
            SizedBox(
              width: Get.width,
              height: 82,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 82,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFDADADA)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Positioned(
                    left: 18,
                    top: 18,
                    child: Container(
                      width: 37,
                      height: 37,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://www.yogaiya.in/wp-content/uploads/2023/03/MAHATI-WELLNESS-PVT-LTD.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 66,
                    top: 18,
                    child: SizedBox(
                      width: 250,
                      child: Text(
                        'Video terbaru kami telah muncul, siap memikat hatimu. Jangan lewatkan keseruan ini!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: Resources.font.primaryFont,
                          fontWeight: FontWeight.w300,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 18,
                    top: 18,
                    child: Text(
                      '8h',
                      style: TextStyle(
                        color: const Color(0xFF2C3131),
                        fontSize: 10,
                        fontFamily: Resources.font.primaryFont,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
