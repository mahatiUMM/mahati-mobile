import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mahati_mobile/app/modules/pressure/pressure_history/pressure_history_controller.dart';
import 'package:mahati_mobile/app/modules/pressure/widget/pressure_detail_bottom_sheet.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:timezone/standalone.dart';
import 'package:timezone/timezone.dart' as tz;

class PressureHistoryView extends GetView<PressureHistoryController> {
  const PressureHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundHome,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.download_outlined,
              ),
              onPressed: () {
                controller.exportUserPressureHistory();
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
          title: GestureDetector(
            onTap: () => Get.back(),
            child: Text(
              'Lacak Tekanan Darah',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: Resources.font.primaryFont,
              ),
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
          RefreshIndicator(
            color: Resources.color.primaryColor,
            onRefresh: controller.getUserPressureHistory,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    if (controller.pressureHistory.value.isEmpty) {
                      return Center(
                          child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Resources.color.primaryColor),
                      ));
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 18.0, 0, 8.0),
                            child: Text("Data Terbaru",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: Resources.font.primaryFont,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
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
                                        Text(
                                          controller.pressureHistory.value
                                              .first['sistol']
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
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
                                              "diastole",
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
                                          controller.pressureHistory.value
                                              .first['diastole']
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color:
                                                Resources.color.tertiaryColor,
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
                                          controller.pressureHistory.value
                                              .first['heartbeat']
                                              .toString(),
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8.0),
                            child: Text("Riwayat Pengecekan",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: Resources.font.primaryFont,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                          SingleChildScrollView(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.pressureHistory.value.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Slidable(
                                    endActionPane: ActionPane(
                                      motion: const DrawerMotion(),
                                      children: [
                                        SlidableAction(
                                          label: 'Delete History',
                                          autoClose: true,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          onPressed: (context) => controller
                                              .deleteUserPressureHistory(
                                                  controller.pressureHistory
                                                      .value[index]['id']),
                                          backgroundColor:
                                              const Color(0xFFFE4A49),
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                        ),
                                      ],
                                    ),
                                    child: GestureDetector(
                                      onTap: () => Get.bottomSheet(
                                        pressureDetailBottomSheet(
                                            systolic: controller.pressureHistory
                                                .value[index]['sistol']
                                                .toString(),
                                            diastolic: controller
                                                .pressureHistory
                                                .value[index]['diastole']
                                                .toString(),
                                            pulse: controller.pressureHistory
                                                .value[index]['heartbeat']
                                                .toString(),
                                            image: controller.pressureHistory
                                                .value[index]['image']),
                                        isScrollControlled: true,
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(18),
                                        decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shadows: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(
                                                  0.15), // Shadow color
                                              spreadRadius: 8, // Spread radius
                                              blurRadius: 12, // Blur radius
                                              offset:
                                                  const Offset(0, 3), // Offset
                                            ),
                                          ],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    DateFormat('EEEE', 'id').format(
                                                        DateTime.parse(controller
                                                                .pressureHistory
                                                                .value[index]
                                                            ['created_at'])),
                                                    style: TextStyle(
                                                      fontFamily: Resources
                                                          .font.primaryFont,
                                                    ),
                                                  ),
                                                  Text(
                                                      DateFormat('MMM dd', 'id')
                                                          .format(DateTime
                                                              .parse(controller
                                                                      .pressureHistory
                                                                      .value[index]
                                                                  [
                                                                  'created_at'])),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: Resources
                                                            .font.primaryFont,
                                                      )),
                                                  Text(
                                                    DateFormat('yyyy', 'id').format(
                                                        DateTime.parse(controller
                                                                .pressureHistory
                                                                .value[index]
                                                            ['created_at'])),
                                                    style: TextStyle(
                                                      fontFamily: Resources
                                                          .font.primaryFont,
                                                    ),
                                                  ),
                                                  Text(
                                                    DateFormat('h:mm a', 'id')
                                                        .format(tz.TZDateTime.from(
                                                            DateTime.parse(controller
                                                                    .pressureHistory
                                                                    .value[index]
                                                                ['created_at']),
                                                            getLocation(
                                                                'Asia/Jakarta'))),
                                                    style: TextStyle(
                                                      fontFamily: Resources
                                                          .font.primaryFont,
                                                    ),
                                                  )
                                                ]),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: SizedBox(
                                                  width: 3,
                                                  height: 80,
                                                  child: Container(
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: (controller.pressureHistory.value[index]['sistol'] >=
                                                                  180 ||
                                                              controller.pressureHistory.value[index][
                                                                      'diastole'] >=
                                                                  120)
                                                          ? Colors.red
                                                              .shade900 // Hypertensive Crisis
                                                          : (controller.pressureHistory.value[index]['sistol'] >=
                                                                      140 ||
                                                                  controller.pressureHistory.value[index]['diastole'] >=
                                                                      90)
                                                              ? Colors
                                                                  .deepOrange
                                                                  .shade700 // Stage 2 Hypertension
                                                              : (controller.pressureHistory.value[index]['sistol'] >=
                                                                          130 ||
                                                                      controller.pressureHistory.value[index]['diastole'] >= 80)
                                                                  ? Colors.orange // Stage 1 Hypertension
                                                                  : (controller.pressureHistory.value[index]['sistol'] >= 120 || controller.pressureHistory.value[index]['diastole'] >= 80)
                                                                      ? Colors.yellow // Elevated Blood Pressure
                                                                      : Colors.green, // Normal Blood Pressure
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  )),
                                            ),
                                            Expanded(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    '${controller.pressureHistory.value[index]['sistol']}/${controller.pressureHistory.value[index]['diastole']}',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: Resources
                                                          .font.primaryFont,
                                                    ),
                                                  ),
                                                  Text(
                                                    ' mmHg',
                                                    style: TextStyle(
                                                      fontFamily: Resources
                                                          .font.primaryFont,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                '${controller.pressureHistory.value[index]['heartbeat']} BPM',
                                                style: TextStyle(
                                                  fontFamily: Resources
                                                      .font.primaryFont,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '${controller.pressureHistory.value.length} readings'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
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
                            padding: const EdgeInsets.fromLTRB(12, 24, 12, 12),
                            child: SfCartesianChart(
                                legend: const Legend(
                                    isVisible: true,
                                    position: LegendPosition.bottom),
                                primaryYAxis: const CategoryAxis(
                                  title: AxisTitle(
                                      text: 'Sys/Dia (mmHg) Pulse (BPM)'),
                                  minimum: 70,
                                  maximum: 190,
                                  interval: 10,
                                ),
                                primaryXAxis: const CategoryAxis(),
                                series: <CartesianSeries>[
                                  LineSeries<PressureData, DateTime>(
                                    color: const Color(0xFFE9CC66),
                                    markerSettings: const MarkerSettings(
                                        isVisible: true,
                                        shape: DataMarkerType.circle,
                                        color: Color(0xFFE9CC66)),
                                    dataSource: controller.pressureHistory.value
                                        .map((e) => PressureData(
                                            e['sistol'],
                                            e['diastole'],
                                            e['heartbeat'],
                                            DateTime.parse(e['created_at'])))
                                        .toList(),
                                    xValueMapper: (PressureData pressure, _) =>
                                        pressure.datetime,
                                    yValueMapper: (PressureData pressure, _) =>
                                        pressure.sistol,
                                    name: 'Systolic',
                                  ),
                                  LineSeries<PressureData, DateTime>(
                                    color: Resources.color.tertiaryColor1,
                                    markerSettings: MarkerSettings(
                                        isVisible: true,
                                        shape: DataMarkerType.circle,
                                        color: Resources.color.tertiaryColor1),
                                    dataSource: controller.pressureHistory.value
                                        .map((e) => PressureData(
                                            e['sistol'],
                                            e['diastole'],
                                            e['heartbeat'],
                                            DateTime.parse(e['created_at'])))
                                        .toList(),
                                    xValueMapper: (PressureData pressure, _) =>
                                        pressure.datetime,
                                    yValueMapper: (PressureData pressure, _) =>
                                        pressure.diastole,
                                    name: 'diastole',
                                  ),
                                  LineSeries<PressureData, DateTime>(
                                    color: Resources.color.primaryColor,
                                    markerSettings: MarkerSettings(
                                        isVisible: true,
                                        shape: DataMarkerType.circle,
                                        color: Resources.color.primaryColor),
                                    dataSource: controller.pressureHistory.value
                                        .map((e) => PressureData(
                                            e['sistol'],
                                            e['diastole'],
                                            e['heartbeat'],
                                            DateTime.parse(e['created_at'])))
                                        .toList(),
                                    xValueMapper: (PressureData pressure, _) =>
                                        pressure.datetime,
                                    yValueMapper: (PressureData pressure, _) =>
                                        pressure.heartbeat,
                                    name: 'Heartbeat',
                                  ),
                                ]),
                          ),
                        ),
                      ),
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
                          padding: const EdgeInsets.fromLTRB(6, 24, 6, 6),
                          child: Column(
                            children: [
                              SfCartesianChart(
                                primaryXAxis: NumericAxis(
                                    title: const AxisTitle(
                                        text: 'diastole (mmHg)'),
                                    minimum: 40,
                                    maximum: 130,
                                    interval: 10,
                                    plotBands: <PlotBand>[
                                      const PlotBand(
                                        start: 80,
                                        end: 90,
                                        associatedAxisEnd: 140,
                                        color: Colors.orange,
                                      ),
                                      PlotBand(
                                        start: 90,
                                        end: 120,
                                        associatedAxisEnd: 140,
                                        color: Colors.deepOrange.shade700,
                                      ),
                                      PlotBand(
                                        start: 120,
                                        color: Colors.red.shade900,
                                      ),
                                    ]),
                                primaryYAxis: NumericAxis(
                                  title:
                                      const AxisTitle(text: 'Systolic (mmHg)'),
                                  minimum: 70,
                                  maximum: 190,
                                  interval: 10,
                                  plotBands: <PlotBand>[
                                    const PlotBand(
                                      text: "Normal",
                                      horizontalTextAlignment: TextAnchor.start,
                                      verticalTextAlignment: TextAnchor.start,
                                      horizontalTextPadding: "8",
                                      start: 0,
                                      end: 120,
                                      associatedAxisEnd: 80,
                                      color: Colors.lightGreen,
                                    ),
                                    const PlotBand(
                                      text: "Evaluate",
                                      horizontalTextPadding: "8",
                                      horizontalTextAlignment: TextAnchor.start,
                                      verticalTextAlignment: TextAnchor.start,
                                      start: 120,
                                      end: 130,
                                      associatedAxisEnd: 80,
                                      color: Colors.yellow,
                                    ),
                                    const PlotBand(
                                      text: "Hypertension Stage 1",
                                      horizontalTextPadding: "8",
                                      horizontalTextAlignment: TextAnchor.start,
                                      verticalTextAlignment: TextAnchor.start,
                                      start: 130,
                                      end: 140,
                                      associatedAxisEnd: 90,
                                      color: Colors.orange,
                                    ),
                                    PlotBand(
                                      text: "Hypertension Stage 2",
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      horizontalTextPadding: "8",
                                      horizontalTextAlignment: TextAnchor.start,
                                      verticalTextAlignment: TextAnchor.start,
                                      start: 140,
                                      end: 180,
                                      associatedAxisEnd: 120,
                                      color: Colors.deepOrange.shade700,
                                    ),
                                    PlotBand(
                                      text: "Hypertension Stage 3",
                                      textStyle: const TextStyle(
                                        color: Colors.white,
                                      ),
                                      horizontalTextPadding: "8",
                                      horizontalTextAlignment: TextAnchor.start,
                                      start: 180,
                                      color: Colors.red.shade900,
                                    ),
                                  ],
                                ),
                                series: <CartesianSeries>[
                                  ScatterSeries<PressureData, int>(
                                    color: Colors.black,
                                    dataSource: controller.pressureHistory.value
                                        .map((e) => PressureData(
                                            e['sistol'],
                                            e['diastole'],
                                            e['heartbeat'],
                                            DateTime.parse(e['created_at'])))
                                        .toList(),
                                    xValueMapper: (PressureData pressure, _) =>
                                        pressure.diastole,
                                    yValueMapper: (PressureData pressure, _) =>
                                        pressure.sistol,
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Classification ACC/AHA 2017"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
