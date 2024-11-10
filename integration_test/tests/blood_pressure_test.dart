import "package:flutter_test/flutter_test.dart";
import "package:integration_test/integration_test.dart";

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group("TODO: ", () {
    testWidgets(
      "Validate TODO Creation ",
      (widgetTester) async {},
      skip: false,
      timeout: const Timeout(Duration(minutes: 5)),
    );
  });
}
