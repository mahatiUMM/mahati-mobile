import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class PressureView extends StatelessWidget {
  const PressureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
                _buildPressureReading('Systolic', '50', '(mmHg)'),
                const SizedBox(width: 10),
                _buildPressureReading('Diastolic', '50', '(mmHg)'),
                const SizedBox(width: 10),
                _buildPressureReading('Pulse', '20', '(BMP)'),
              ],
            ),
            Text(
              'Media',
              style: TextStyle(
                color: Resources.color.baseColor,
                fontSize: 20,
                fontFamily: Resources.font.primaryFont,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMediaOption('Open Camera', Icons.camera_alt),
                const SizedBox(height: 10),
                _buildMediaOption('Upload File', Icons.file_upload),
                const SizedBox(height: 20),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Add your save functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Resources.color.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 120),
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
          ],
        ),
      ),
    );
  }

  Widget _buildPressureReading(String title, String value, String unit) {
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
              Text(
                value,
                style: TextStyle(
                  color: Color(0xFF2C3131),
                  fontSize: 36,
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w700,
                ),
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
          print("Media Option Clicked");
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
