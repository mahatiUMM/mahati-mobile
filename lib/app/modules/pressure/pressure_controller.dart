import 'dart:convert';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahati_mobile/app/core/data/blood_pressure_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/modules/home/home_controller.dart';
import 'package:mahati_mobile/app/modules/pressure/widget/pressure_bottom_sheet.dart';
import 'package:mahati_mobile/app/constants/prompt_gemini.dart';
import 'package:mahati_mobile/app/utils/token_utils.dart';

class PressureController extends GetxController {
  ImagePicker imagePicker = ImagePicker();
  String pressureImage = "";

  final restClient = Get.find<RestClient>();
  final HomeController homeController = Get.find<HomeController>();

  final TextEditingController sistolController = TextEditingController();
  final TextEditingController diastoleController = TextEditingController();
  final TextEditingController heartbeatController = TextEditingController();

  final assetsAudioPlayer = AssetsAudioPlayer();

  RxBool aiLoading = false.obs;
  RxBool postLoading = false.obs;

  final token = getToken();

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

      final token = await getToken();
      final request = await restClient.requestWithToken(
          "/blood_pressure",
          HttpMethod.POST,
          BloodPressureModel(
                  image: null,
                  sistol: int.parse(sistol),
                  diastole: int.parse(diastole),
                  heartbeat: int.parse(heartbeat))
              .toJson(),
          token.toString(),
          imageFile: pressureImage != "" ? File(pressureImage) : null);

      if (request.statusCode == 201) {
        homeController.getUserDashboard();
        openPressureResult();
        Get.snackbar(
            backgroundColor: Colors.green,
            colorText: Colors.white,
            "Cek Tekanan Darah",
            "Riwayat cek berhasil disimpan.");
      } else {
        Get.snackbar(
            backgroundColor: Colors.red,
            colorText: Colors.white,
            "Cek Tekanan Darah",
            request.body);
      }
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
    final int systolic = int.tryParse(sistolController.value.text) ?? 0;
    final int diastolic = int.tryParse(diastoleController.value.text) ?? 0;

    bool isNormal = systolic <= 120 && diastolic <= 80;

    Get.bottomSheet(pressureBottomSheet(
      diastolic: diastoleController.value.text,
      pulse: heartbeatController.value.text,
      systolic: sistolController.value.text,
      isNormal: isNormal, // Pass the condition here
    ));

    String audioFile = isNormal
        ? "assets/audios/tekanan_darah_normal.mp3"
        : "assets/audios/tekanan_darah_tidak_normal.mp3";

    assetsAudioPlayer.open(Audio(audioFile));
    assetsAudioPlayer.stop();
  }

  Future<void> takeBloodPressureImage(ImageSource source) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: 'AIzaSyAya0s1Jc0RraJTQ5Ooh3xidk99jcbiZb4',
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
          Map<String, dynamic> resultData = jsonDecode(
              result.replaceAll('```json', '').replaceAll('```', '').trim());

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
