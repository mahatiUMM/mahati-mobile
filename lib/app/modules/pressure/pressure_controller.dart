import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahati_mobile/app/core/data/blood_pressure_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/modules/pressure/widget/pressure_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PressureController extends GetxController {
  ImagePicker imagePicker = ImagePicker();
  String pressureImage = "";

  final TextEditingController sistolController = TextEditingController();
  final TextEditingController diastoleController = TextEditingController();
  final TextEditingController heartbeatController = TextEditingController();

  final assetsAudioPlayer = AssetsAudioPlayer();

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<int> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return int.parse(prefs.getString('userId')!);
  }

  postBloodPressure(
      {required String sistol,
      required String diastole,
      required String heartbeat}) async {
    try {
      if (diastole.isEmpty || sistol.isEmpty || heartbeat.isEmpty) {
        Get.snackbar(
            backgroundColor: Colors.red,
            colorText: Colors.white,
            "Cek Tekanan Darah",
            "Mohon isi semua data Systolic, Diastolic, dan Pulse.");
        return;
      }

      final userId = await getUserId();
      final restClient = Get.find<RestClient>();

      BloodPressureModel bloodPressureModel = BloodPressureModel(
          user_id: userId,
          image: pressureImage,
          sistol: int.parse(sistol),
          diastole: int.parse(diastole),
          heartbeat: int.parse(heartbeat));

      await restClient.request(
          "/blood_pressure", HttpMethod.POST, bloodPressureModel.toJson());
      openPressureResult();
      Get.snackbar(
          backgroundColor: Colors.green,
          colorText: Colors.white,
          "Cek Tekanan Darah",
          "Riwayat cek berhasil disimpan.");
    } catch (e) {
      Get.snackbar(
          backgroundColor: Colors.red,
          colorText: Colors.white,
          "Failed",
          e.toString());
    }
  }

  void openPressureResult() {
    Get.bottomSheet(pressureBottomSheet(
        diastolic: diastoleController.value.text,
        pulse: heartbeatController.value.text,
        systolic: sistolController.value.text));
    assetsAudioPlayer.open(
      Audio("assets/audios/tekanan_darah_normal.mp3"),
    );
    assetsAudioPlayer.stop();
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
