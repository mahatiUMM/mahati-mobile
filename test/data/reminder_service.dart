import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../service/reminder_service.dart';
import 'reminder_service.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("Test Reminder Service", () {
    const baseUrl = "https://mahati.xyzuan.my.id/api";
    const token = "";

    test("Fetch reminder by user succesfully from an API", () async {
      final client = MockClient();
      final service = ReminderService(baseUrl, client: client);

      when(client.get(Uri.parse(baseUrl + "/reminder"))).thenAnswer(
          (_) async => http.Response('["Reminder 1", "Reminder 2"]', 200));
      final reminders = await service.getReminderByUserId();
      expect(reminders, ["Reminder 1", "Reminder 2"]);
      verify(client.get(Uri.parse(baseUrl + "/reminder"))).called(1);
      verifyNoMoreInteractions(client);
    });
  });
}
