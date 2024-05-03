import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/inbox/inbox_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

class InboxView extends GetView<InboxController> {
  const InboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
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
                const SizedBox(height: 20),
                Container(
                  width: Get.width,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFDADADA)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        child: SvgPicture.asset(
                          controller.logo,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 250,
                        child: Text(
                          'Video terbaru kami telah muncul, siap memikat hatimu. Jangan lewatkan keseruan ini!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: Resources.font.primaryFont,
                            fontWeight: FontWeight.w400,
                          ),
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        child: Text(
                          "8h",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: Resources.font.primaryFont,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
