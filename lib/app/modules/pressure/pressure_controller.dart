import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahati_mobile/app/core/data/blood_pressure_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/utils/show_bar/show_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PressureController extends GetxController {
  ImagePicker imagePicker = ImagePicker();
  String pressureImage = "";

  final TextEditingController sistolController = TextEditingController();
  final TextEditingController diastoleController = TextEditingController();
  final TextEditingController heartbeatController = TextEditingController();

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<int> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return int.parse(prefs.getString('userId')!);
  }

  postBloodPressure(
      {required int sistol,
      required int diastole,
      required int heartbeat}) async {
    try {
      final userId = await getUserId();
      final restClient = Get.find<RestClient>();

      BloodPressureModel bloodPressureModel = BloodPressureModel(
          user_id: userId,
          image: pressureImage,
          sistol: sistol,
          diastole: diastole,
          heartbeat: heartbeat);

      await restClient.request(
          "/blood_pressure", HttpMethod.POST, bloodPressureModel.toJson());
      Get.snackbar(
          backgroundColor: Colors.green,
          colorText: Colors.white,
          "Success",
          "Record was successfully saved.");
    } catch (e) {
      Get.snackbar(
          backgroundColor: Colors.red,
          colorText: Colors.white,
          "Failed",
          e.toString());
    }
  }

  Future<void> takeBloodPressureImage(ImageSource source) async {
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
        pressureImage = pickedImage.path;
        sistolController.text = resultList[0].split(' ')[0];
        diastoleController.text = resultList[1].split(' ')[0];
        heartbeatController.text = resultList[2].split(' ')[0];
      }
    }
  }
}
