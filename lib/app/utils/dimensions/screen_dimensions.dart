import 'package:flutter/material.dart';

class ScreenDimensions {
  // screen height according to device orientation
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // screen width according to device orientation
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // screen Bottom NavigationBar Height according to device orientation
  static double bottomNavigationBarHeight(BuildContext context) {
    return kBottomNavigationBarHeight;
  }
}