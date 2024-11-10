import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/modules/splash/splash_controller.dart';
import 'package:mahati_mobile/app/modules/splash/splash_view.dart';

void main() {
  Get.put(SplashController());
  Get.put(RestClient());

  testWidgets("Test title on Splash Screen UI", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashView()));

    expect(find.byType(SplashView), findsOneWidget);
    expect(find.text("mahati."), findsOneWidget);
    expect(find.textContaining("mahati."), findsOneWidget);
  });

  testWidgets("Test description on Splash Screen UI",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashView()));

    expect(find.text("Mobile Aplikasi Sahabat\nHipertensi"), findsOneWidget);
  });
}
