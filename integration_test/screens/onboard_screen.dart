import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_controller.dart';
import 'package:mahati_mobile/app/modules/onboard/onboard_view.dart';

void main() {
  Get.put(OnBoardController());

  testWidgets("Test ", (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: OnboardView()));
  });
}
