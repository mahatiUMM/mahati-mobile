import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahati_mobile/app/modules/pressure/pressure_controller.dart';
import 'package:mahati_mobile/app/utils/constants/animation_urls.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:lottie/lottie.dart';

class PressureView extends GetView<PressureController> {
  const PressureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 20,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Kembali',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Obx(
            () {
              if (controller.aiLoading.value) {
                return SizedBox(
                  height: Get.height - 150,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(AnimationUrls.aiLensAnimation,
                            repeat: true, width: 240),
                        Text(
                          "Sedang mengambil data...",
                          style: TextStyle(
                              fontFamily: Resources.font.primaryFont,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cek Tekanan Darah',
                      style: TextStyle(
                        color: Color(0xFF2C3131),
                        fontSize: 24,
                        fontFamily: Resources.font.primaryFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Lottie.asset(
                        AnimationUrls.heartDashboardAnimation,
                        height: 290,
                        width: 290,
                        repeat: false,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildPressureReading(
                            'Systolic', '(mmHg),', controller.sistolController),
                        const SizedBox(width: 10),
                        _buildPressureReading('Diastolic', '(mmHg)',
                            controller.diastoleController),
                        const SizedBox(width: 10),
                        _buildPressureReading(
                            'Pulse', '(BMP)', controller.heartbeatController),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Input Otomatis',
                      style: TextStyle(
                        color: Resources.color.baseColor,
                        fontSize: 20,
                        fontFamily: Resources.font.primaryFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildMediaOption('Buka Kamera', Icons.camera_alt),
                        const SizedBox(height: 10),
                        _buildMediaOption('Upload Gambar', Icons.file_upload),
                        const SizedBox(height: 20),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        await controller.postBloodPressure(
                            sistol: controller.sistolController.text,
                            diastole: controller.diastoleController.text,
                            heartbeat: controller.heartbeatController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Resources.color.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: SizedBox(
                        width: Get.width,
                        height: 50,
                        child: Center(child: Obx(() {
                          if (controller.postLoading.value) {
                            return CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Resources.color.whiteColor),
                            );
                          } else {
                            return Text(
                              'Simpan',
                              style: TextStyle(
                                color: Resources.color.whiteColor,
                                fontSize: 16,
                                fontFamily: Resources.font.primaryFont,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          }
                        })),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: SizedBox(
                        width: Get.width,
                        child: GestureDetector(
                          onTap: () => Get.toNamed('/pressure/history'),
                          child: const Text(
                            "Riwayat Tekanan Darah",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
            },
          )),
    );
  }

  Widget _buildPressureReading(
      String title, String unit, TextEditingController controller) {
    return Row(
      children: [
        Container(
          width: 94,
          height: 145,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.10), // Shadow color
                  spreadRadius: 8, // Spread radius
                  blurRadius: 12, // Blur radius
                  offset: const Offset(0, 3), // Offset
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF2C3131),
                  fontSize: 14,
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 3,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  counter: const SizedBox.shrink(),
                  border: InputBorder.none,
                  hintText: "0",
                  hintStyle: TextStyle(
                    color: Color(0xFF2C3131),
                    fontSize: 36,
                    // Assuming Resources class has font property
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: TextStyle(
                  color: Color(0xFF2C3131),
                  fontSize: 36,
                  // Assuming Resources class has font property
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,
              ),
              Text(
                unit,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMediaOption(String title, IconData icon) {
    return Container(
      width: Get.width / 2 - 28,
      height: 47,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.10), // Shadow color
              spreadRadius: 8, // Spread radius
              blurRadius: 12, // Blur radius
              offset: const Offset(0, 3), // Offset
            ),
          ]),
      child: TextButton.icon(
        onPressed: () {
          if (title == 'Buka Kamera') {
            controller.takeBloodPressureImage(ImageSource.camera);
          } else {
            controller.takeBloodPressureImage(ImageSource.gallery);
          }
        },
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        label: Text(
          title,
          style: TextStyle(
            color: Color(0xFF2C3131),
            fontSize: 12,
            fontFamily: Resources.font.primaryFont,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
