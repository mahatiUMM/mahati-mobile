import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/pressure/pressure_history/pressure_history_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PressureHistoryView extends GetView<PressureHistoryController> {
  const PressureHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundHome,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
              ),
              onPressed: () {
                // Add your action here
              },
            ),
          ],
          elevation: 0,
          leadingWidth: 20,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text(
            'Lacak Tekanan Darah',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: TabBar(
            indicatorColor: Resources.color.primaryColor,
            labelColor: Colors.black,
            overlayColor: MaterialStateColor.resolveWith(
              (states) => Colors.transparent,
            ),
            controller: controller.tabController,
            tabs: controller.myTabs,
          ),
        ),
        body: TabBarView(controller: controller.tabController, children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Column(
                    children: [
                      Container(
                          width: Get.width,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shadows: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.15), // Shadow color
                                spreadRadius: 8, // Spread radius
                                blurRadius: 12, // Blur radius
                                offset: const Offset(0, 3), // Offset
                              ),
                            ],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Systolic",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily:
                                                Resources.font.primaryFont,
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        const Text("(mmHg)")
                                      ],
                                    ),
                                    const Text(
                                      '50',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFFE9CC66),
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                        height: 0.03,
                                        letterSpacing: 0.06,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Diastolic",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily:
                                                Resources.font.primaryFont,
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        const Text("(mmHg)")
                                      ],
                                    ),
                                    Text(
                                      '50',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Resources.color.tertiaryColor,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                        height: 0.03,
                                        letterSpacing: 0.06,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Pulse",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily:
                                                Resources.font.primaryFont,
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        const Text(
                                          "(BMP)",
                                        )
                                      ],
                                    ),
                                    Text(
                                      '50',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Resources.color.primaryColor,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                        height: 0.03,
                                        letterSpacing: 0.06,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                      const SizedBox(height: 30),
                      Container(
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.15), // Shadow color
                              spreadRadius: 8, // Spread radius
                              blurRadius: 12, // Blur radius
                              offset: const Offset(0, 3), // Offset
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
                          child: SfCartesianChart(
                              legend: const Legend(
                                  isVisible: true,
                                  position: LegendPosition.bottom),
                              primaryXAxis: const CategoryAxis(),
                              primaryYAxis: const NumericAxis(
                                axisLine: AxisLine(width: 0),
                              ),
                              series: <CartesianSeries>[
                                ColumnSeries<PressureData, String>(
                                  color: const Color(0xFFE9CC66),
                                  dataSource: controller.pressureHistory.value
                                      .map((e) => PressureData(
                                          e['sistol'],
                                          e['diastole'],
                                          e['heartbeat'],
                                          DateTime.parse(e['created_at'])))
                                      .toList(),
                                  xValueMapper: (PressureData pressure, _) =>
                                      '${pressure.datetime.day}/${pressure.datetime.month}/${pressure.datetime.year}',
                                  yValueMapper: (PressureData pressure, _) =>
                                      pressure.sistol,
                                  name: 'Systolic',
                                ),
                                ColumnSeries<PressureData, String>(
                                  color: Resources.color.tertiaryColor1,
                                  dataSource: controller.pressureHistory.value
                                      .map((e) => PressureData(
                                          e['sistol'],
                                          e['diastole'],
                                          e['heartbeat'],
                                          DateTime.parse(e['created_at'])))
                                      .toList(),
                                  xValueMapper: (PressureData pressure, _) =>
                                      '${pressure.datetime.day}/${pressure.datetime.month}/${pressure.datetime.year}',
                                  yValueMapper: (PressureData pressure, _) =>
                                      pressure.diastole,
                                  name: 'Diastole',
                                ),
                                ColumnSeries<PressureData, String>(
                                  color: Resources.color.primaryColor,
                                  dataSource: controller.pressureHistory.value
                                      .map((e) => PressureData(
                                          e['sistol'],
                                          e['diastole'],
                                          e['heartbeat'],
                                          DateTime.parse(e['created_at'])))
                                      .toList(),
                                  xValueMapper: (PressureData pressure, _) =>
                                      '${pressure.datetime.day}/${pressure.datetime.month}/${pressure.datetime.year}',
                                  yValueMapper: (PressureData pressure, _) =>
                                      pressure.heartbeat,
                                  name: 'Heartbeat',
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("2")],
            ),
          )
        ]));
  }
}
