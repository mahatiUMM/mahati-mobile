import 'dart:io';
import 'package:flutter/widgets.dart';
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
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final RecognizedText recognizedText = await textRecognizer
          .processImage(InputImage.fromFile(File(pickedImage.path)));
      textRecognizer.close();
      Get.snackbar(
        "Blood Pressure Result,",
        recognizedText.text,
      );
    }
  }
}
