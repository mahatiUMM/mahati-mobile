import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PressureHistoryController extends GetxController
    with SingleGetTickerProviderMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Tekanan Darah'),
    Tab(text: 'Detak Jantung'),
  ];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
