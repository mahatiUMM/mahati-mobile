import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/home/widget/greeting.dart';
import 'package:mahati_mobile/app/modules/home/widget/slider.dart';
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
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.only(bottom: 30.0, left: 30.0, right: 30.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: BottomAppBar(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () {
                        print("clicked 1st icon");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.inbox),
                      onPressed: () {
                        print("clicked 2nd icon");
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.person),
                      onPressed: () {
                        print("clicked 3rd icon");
                      },
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
