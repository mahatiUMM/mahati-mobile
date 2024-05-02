import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Color(0xFFF9F9F9),
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Color(0xFFF9F9F9),
  ));

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      ),
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
