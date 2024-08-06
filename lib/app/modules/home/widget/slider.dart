import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mahati_mobile/app/modules/home/widget/blood_pressure_dashboard.dart';
import 'package:mahati_mobile/app/modules/home/widget/reminder_dashboard.dart';
import 'package:sizer/sizer.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      scrollPhysics: const BouncingScrollPhysics(),
                      height: null,
                      enableInfiniteScroll: true,
                      viewportFraction: 1),
                  items: [bloodPressureDashboard(), reminderDashboard()],
                ),
              ],
            ));
      },
    );
  }
}
