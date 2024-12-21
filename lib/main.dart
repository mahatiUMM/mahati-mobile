import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mahati_mobile/app/utils/notification_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  await Get.putAsync(() async => await SharedPreferences.getInstance());
  await initializeDateFormatting('id_ID', null);
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await NotificationService().initNotification();

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("2c504865-7ffc-4ea5-9c67-895b885fbb93");
  OneSignal.Notifications.requestPermission(true);

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
          primaryColor: Resources.color.primaryColor),
      title: "mahati.",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
