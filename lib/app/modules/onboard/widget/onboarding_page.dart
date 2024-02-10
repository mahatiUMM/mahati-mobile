import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/dimensions/screen_dimensions.dart';

// onboarding page components

class OnBoardingPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;

  const OnBoardingPage({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 12, right: 12, top: 42),
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            height: 320,
            width: ScreenDimensions.screenWidth(context),
          ),

          // image

          // title
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 29,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 16.0),

          // subtitle
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
