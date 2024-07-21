import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mahati_mobile/app/core/network/rest_client.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:mahati_mobile/app/utils/resources.dart';

class PressureData {
  final int sistol;
  final int diastole;
  final int heartbeat;
  final DateTime datetime;

  PressureData(this.sistol, this.diastole, this.heartbeat, this.datetime);
}

class PressureHistoryController extends GetxController
    with
        // ignore: deprecated_member_use
        SingleGetTickerProviderMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Data Tekanan Darah'),
    const Tab(text: 'Statistik Tekanan Darah'),
  ];

  late TabController tabController;
  var pressureHistory = Rx<List<dynamic>>([]);
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
    getUserPressureHistory();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> getUserPressureHistory() async {
    isLoading.value = true;
    final token = await getToken();
    final restClient = Get.find<RestClient>();
    final result = await restClient.requestWithToken(
      "/blood_pressure",
      HttpMethod.GET,
      null,
      token.toString(),
    );

    Map<String, dynamic> parsedJson = json.decode(result.body);
    List<dynamic> dataList = parsedJson['data'];
    dataList.sort((a, b) => b['created_at'].compareTo(a['created_at']));
    pressureHistory.value = dataList;
    isLoading.value = false;
  }

  Future<void> exportUserPressureHistory() async {
    final status = await Permission.storage.status;
    if (status.isGranted) {
      final token = await getToken();
      final restClient = Get.find<RestClient>();
      final result = await restClient.requestWithToken(
        "/export/blood_pressure",
        HttpMethod.GET,
        null,
        token.toString(),
      );
      final directory = Directory("/storage/emulated/0/Download");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      final filePath = path.join(directory.path, "blood_pressure.xlsx");
      final file = File(filePath);
      await file.writeAsBytes(result.bodyBytes);
      Get.snackbar(
        "Export Data Tekanan Darah",
        "Berhasil, file tersimpan di Download",
        backgroundColor: Resources.color.primaryColor,
        colorText: Resources.color.whiteColor,
      );
    } else {
      Get.snackbar(
        "Export Data Tekanan Darah",
        "Gagal, izin penyimpanan ditolak",
        backgroundColor: Resources.color.secondaryColor,
        colorText: Resources.color.whiteColor,
      );
    }
  }
}
