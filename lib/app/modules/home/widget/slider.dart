import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            width: Get.width,
            height: 200,
            decoration: ShapeDecoration(
              color: Resources.color.baseColor2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        );
      },
    );
  }
}
