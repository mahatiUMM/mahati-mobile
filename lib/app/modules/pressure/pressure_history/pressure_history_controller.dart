import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PressureData {
  final int sistol;
  final int diastole;
  final int heartbeat;
  final DateTime datetime;

  PressureData(this.sistol, this.diastole, this.heartbeat, this.datetime);
}

class PressureHistoryController extends GetxController
    with SingleGetTickerProviderMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Tekanan Darah'),
    const Tab(text: 'Detak Jantung'),
  ];

  late TabController tabController;
  var pressureHistory = Rx<List<dynamic>>([]);
  // var currentSistoleHistory = Rx(String);
  // var currentDiastoleHistory = Rx(String);
  // var currentHeartbeatHistory = Rx(String);

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
  }
}
