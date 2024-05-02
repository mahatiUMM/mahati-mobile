import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/blood_pressure_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';

class PressureHistoryController extends GetxController
    with SingleGetTickerProviderMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Tekanan Darah'),
    Tab(text: 'Detak Jantung'),
  ];

  late TabController tabController;
  var pressureHistory = Rx<List<dynamic>>([]);

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

  Future<void> getUserPressureHistory() async {
    final restClient = Get.find<RestClient>();

    final result =
        await restClient.request("/blood_pressure", HttpMethod.GET, null);

    // Parse the JSON string
    Map<String, dynamic> parsedJson = json.decode(result.body);

    // Access the data key
    List<dynamic> dataList = parsedJson['data'];
    pressureHistory.value = dataList;
    // var responseData = BloodPressureModel.fromJson(jsonDecode(result.body));
    // print(responseData);
  }
}
