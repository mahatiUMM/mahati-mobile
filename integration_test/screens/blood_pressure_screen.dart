import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mahati_mobile/app/modules/pressure/pressure_view.dart';
import 'package:mahati_mobile/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Blood Pressure View UI Elements", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PressureView()));

    expect(find.text("Kembali"), findsOneWidget);
  });
}
