import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/home/widget/bottom_navbar.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, devicetype) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                Row(
                  children: [
                    greetingWidget("Rizky Haksono"),
                  ],
                ),
                const SizedBox(height: 20),
                sliderWidget(),
                BottomNavbarHome()
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget greetingWidget(String username) {
  return Padding(
    padding: const EdgeInsets.only(top: 70.0, left: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hai, $username',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Text(
          'Selamat Datang!',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

Widget sliderWidget() {
  return Container(
    width: 350,
    height: 200,
    decoration: ShapeDecoration(
      color: const Color(0xFF808080),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
