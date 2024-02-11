import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_controller.dart';
import 'package:mahati_mobile/app/utils/dimensions/screen_dimensions.dart';

class SkipButton extends GetView<OnBoardController> {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: ScreenDimensions.bottomNavigationBarHeight(context) * 0.65,
      left: 25.0,
      child: TextButton(
        onPressed: () => controller.skipPage(),
        child: const Text(
          "Lewati",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
    );
  }
}
