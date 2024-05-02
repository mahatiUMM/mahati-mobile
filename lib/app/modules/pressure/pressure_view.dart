import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahati_mobile/app/modules/pressure/pressure_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class PressureView extends GetView<PressureController> {
  final File? pickedFile;
  const PressureView({Key? key, this.pickedFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
        child: Column(
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
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/pressure_illustration.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPressureReading(
                    'Systolic', '(mmHg),', controller.sistolController),
                const SizedBox(width: 10),
                _buildPressureReading(
                    'Diastolic', '(mmHg)', controller.diastoleController),
                const SizedBox(width: 10),
                _buildPressureReading(
                    'Pulse', '(BMP)', controller.heartbeatController),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Media',
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
                _buildMediaOption('Open Camera', Icons.camera_alt),
                const SizedBox(height: 10),
                _buildMediaOption('Upload File', Icons.file_upload),
                const SizedBox(height: 20),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await controller.postBloodPressure(
                    sistol: int.parse(controller.sistolController.text),
                    diastole: int.parse(controller.diastoleController.text),
                    heartbeat: int.parse(controller.heartbeatController.text));
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
                child: Center(
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                      color: Resources.color.whiteColor,
                      fontSize: 16,
                      fontFamily: Resources.font.primaryFont,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
            color: Color(0xFFF5F6F8),
            borderRadius: BorderRadius.circular(15),
          ),
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
      width: Get.width * 0.4,
      height: 47,
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton.icon(
        onPressed: () {
          if (title == 'Open Camera') {
            controller.takeBloodPressureImage(ImageSource.camera, pickedFile);
          } else {
            controller.takeBloodPressureImage(ImageSource.gallery, pickedFile);
          }
        },
        icon: Icon(icon),
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
