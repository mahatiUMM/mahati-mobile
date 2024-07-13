import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          fit: BoxFit.cover,
                          "https://rsjpparamarta.com/images/artikel-mencegah-komplikasi-diabetes-melitus.jpg"),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          fit: BoxFit.cover,
                          "https://mysiloam-api.siloamhospitals.com/storage-down/website-cms/website-cms-16982211031288331.webp"),
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
