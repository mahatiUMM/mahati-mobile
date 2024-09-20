import 'dart:convert';
import 'package:http/http.dart' as http;

class ReminderService {
  final String apiUrl;
  final http.Client client;

  ReminderService(this.apiUrl, {required this.client});

  Future<List<String>> getReminderByUserId() async {
    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => e.toString()).toList();
    } else {
      throw Exception('Failed to load reminder');
    }
  }
}
