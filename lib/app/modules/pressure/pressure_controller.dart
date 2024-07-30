import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahati_mobile/app/core/data/blood_pressure_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/modules/pressure/widget/pressure_bottom_sheet.dart';
import 'package:mahati_mobile/app/utils/constants/prompt_gemini.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PressureController extends GetxController {
  ImagePicker imagePicker = ImagePicker();
  String pressureImage = "";

  final TextEditingController sistolController = TextEditingController();
  final TextEditingController diastoleController = TextEditingController();
  final TextEditingController heartbeatController = TextEditingController();

  final assetsAudioPlayer = AssetsAudioPlayer();

  RxBool aiLoading = false.obs;
  RxBool postLoading = false.obs;

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
      postLoading.value = true;
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
    } finally {
      postLoading.value = false;
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
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: 'AIzaSyBgcQbcxtkvJkmqUm-bMXQLNiu9NaH2TUs',
    );

    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);

    try {
      if (pickedImage == null) {
        return;
      } else {
        aiLoading.value = true;
        String result;
        final imgBytes = await pickedImage.readAsBytes();
        final content = [
          Content.multi([
            TextPart(PromptGemini.pressureAILens),
            DataPart('image/jpeg', imgBytes),
          ])
        ];
        var response = await model.generateContent(content);
        result = response.text ?? '';
        if (result.isNotEmpty) {
          Map<String, dynamic> resultData = jsonDecode(result);

          if (resultData['systolic'].toString() == 'null' ||
              resultData['diastolic'].toString() == 'null' ||
              resultData['heartbeat'].toString() == 'null') {
            Get.snackbar(
              backgroundColor: Colors.red,
              colorText: Colors.white,
              "AI Blood Pressure",
              "Data Tidak Valid, ${resultData['msg'].toString()}",
            );
            sistolController.text = "0";
            diastoleController.text = "0";
            heartbeatController.text = "0";
            return;
          }

          pressureImage = pickedImage.path;
          sistolController.text = resultData['systolic'].toString();
          diastoleController.text = resultData['diastolic'].toString();
          heartbeatController.text = resultData['heartbeat'].toString();

          Get.snackbar(
            backgroundColor: Colors.green,
            colorText: Colors.white,
            "AI Blood Pressure",
            "Data tekanan darah berhasil diambil",
          );
        } else {
          Get.snackbar(
              backgroundColor: Colors.red,
              colorText: Colors.white,
              "AI Blood Pressure",
              "Data tekanan darah gagal diambil, Mohon Coba Lagi.");
        }
      }
    } catch (e) {
      Get.snackbar(
          backgroundColor: Colors.red,
          colorText: Colors.white,
          "AI Blood Pressure",
          e.toString());
    } finally {
      aiLoading.value = false;
    }
  }
}
