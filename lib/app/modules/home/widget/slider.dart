import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
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
                      height: 200,
                      enableInfiniteScroll: false,
                      viewportFraction: 1),
                  items: [
                    Container(
                      decoration: BoxDecoration(
                        color: Resources.color.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Resources.color.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
