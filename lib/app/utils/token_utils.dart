import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('authToken');
}

Future<int> getUserId() async {
  final prefs = await SharedPreferences.getInstance();
  return int.parse(prefs.getString('userId')!);
}
