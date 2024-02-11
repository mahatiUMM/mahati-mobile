import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_controller.dart';
import 'package:mahati_mobile/app/utils/dimensions/screen_dimensions.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: ScreenDimensions.bottomNavigationBarHeight(context) * 0.65,
      right: 25.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF40D99E),
          foregroundColor: Colors.white,
        ),
        onPressed: OnBoardController.instance.nextPage,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
