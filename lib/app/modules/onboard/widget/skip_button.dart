import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_controller.dart';
import 'package:mahati_mobile/app/utils/dimensions/screen_dimensions.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // right: 16.0,
      bottom: ScreenDimensions.bottomNavigationBarHeight(context) * 0.65,
      left: 25.0,
      child: TextButton(
        onPressed: () => OnBoardController.instance.skipPage(),
        child: const Text(
          "Lewati",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
    );
  }
}
