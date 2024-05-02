import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahati_mobile/app/core/data/blood_pressure_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/show_bar/show_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PressureController extends GetxController {
  ImagePicker imagePicker = ImagePicker();

  final TextEditingController sistolController = TextEditingController();
  final TextEditingController diastoleController = TextEditingController();
  final TextEditingController heartbeatController = TextEditingController();

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  postBloodPressure(
      {required int sistol,
      required int diastole,
      required int heartbeat}) async {
    try {
      final token = await getToken();
      final userId = await getUserId();
      final restClient = Get.find<RestClient>();

      BloodPressureModel bloodPressureModel = BloodPressureModel(
          user_id: "2",
          image: "image",
          sistol: sistol,
          diastole: diastole,
          heartbeat: heartbeat);

      final result = await restClient.request(
          "/blood_pressure", HttpMethod.POST, bloodPressureModel.toJson());

      print(result.body);
    } catch (e) {
      print(e);
      showErrorMessage('Registration failed. $e');
    }
  }

  Future<void> takeBloodPressureImage(
      ImageSource source, File? pickedFile) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    if (pickedImage == null) {
      return;
    } else {
      final res = await FlutterTesseractOcr.extractText(pickedImage.path,
          language: 'ssd',
          args: {
            "psm": "4",
            "preserve_interword_spaces": "1",
          });

      final List<String> resultList = res.split('\n');
      if (resultList.length < 3) {
        Get.snackbar(
            backgroundColor: Colors.red,
            colorText: Colors.white,
            "AI Blood Pressure",
            "Failed to get result, please try again.");
      } else {
        Get.snackbar(
          backgroundColor: Colors.green,
          colorText: Colors.white,
          "AI Blood Pressure",
          "Systolic: ${resultList[0].split(' ')[0]}\nDiastolic: ${resultList[1].split(' ')[0]}\nHeartbeat: ${resultList[2].split(' ')[0]}",
        );
        sistolController.text = resultList[0].split(' ')[0];
        diastoleController.text = resultList[1].split(' ')[0];
        heartbeatController.text = resultList[2].split(' ')[0];
      }
    }
  }
}
