import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/modules/profile/profile_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditController extends GetxController {
  Rx<File?> image = Rx<File?>(null);
  final _picker = ImagePicker();

  final ProfileController profileController = Get.find<ProfileController>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> getProfileData() async {
    usernameController.text = profileController.username.value;
    emailController.text = profileController.email.value;
    numberController.text = profileController.phone.value;
  }

  Future<void> pickImage(ImageSource source) async {
    final restClient = Get.find<RestClient>();
    final token = await getToken();
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      final result = await restClient.requestWithToken(
        "/profile",
        HttpMethod.PUT,
        null,
        token.toString(),
        imageFile: imageFile,
      );

      if (result.statusCode == 200) {
        Get.offAllNamed("/layout");
        Get.snackbar(
          'Berhasil mengubah foto profil anda',
          'Data anda sudah berhasil diubah',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Resources.color.textFieldColor,
          colorText: Resources.color.baseColor,
          leftBarIndicatorColor: Resources.color.primaryColor,
          overlayColor: Resources.color.primaryColor,
          progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(
            Resources.color.secondaryColor,
          ),
          animationDuration: const Duration(milliseconds: 500),
          icon: Icon(Icons.error, color: Resources.color.baseColor, size: 20.0),
        );
        return;
      } else {
        Get.snackbar(
          'Gagal mengubah foto profil anda',
          result.body,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Resources.color.textFieldColor,
          colorText: Resources.color.baseColor,
          leftBarIndicatorColor: Resources.color.secondaryColor1,
          overlayColor: Resources.color.primaryColor,
          progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(
            Resources.color.secondaryColor,
          ),
          animationDuration: const Duration(milliseconds: 500),
          icon: Icon(Icons.error, color: Resources.color.baseColor, size: 20.0),
        );
        return;
      }
    }
  }

  Future<void> updateProfile(String name, String email, String number) async {
    final token = await getToken();
    final restClient = Get.find<RestClient>();

    final data = {
      "username": name,
      "email": email,
      "number": number,
      "photo": profileController.photo.value,
    };

    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.PUT, data, token.toString());

    if (result.statusCode == 200) {
      Get.offAllNamed("/layout");
      Get.snackbar(
        'Berhasil mengedit profil anda',
        'Data anda sudah berhasil diubah',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Resources.color.textFieldColor,
        colorText: Resources.color.baseColor,
        leftBarIndicatorColor: Resources.color.primaryColor,
        overlayColor: Resources.color.primaryColor,
        progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(
          Resources.color.secondaryColor,
        ),
        animationDuration: const Duration(milliseconds: 500),
        icon: Icon(Icons.error, color: Resources.color.baseColor, size: 20.0),
      );
      return;
    } else {
      Get.snackbar(
        'Gagal mengedit profil anda',
        'Mohon lengkapi semua data yang diperlukan',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Resources.color.textFieldColor,
        colorText: Resources.color.baseColor,
        leftBarIndicatorColor: Resources.color.secondaryColor1,
        overlayColor: Resources.color.primaryColor,
        progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(
          Resources.color.secondaryColor,
        ),
        animationDuration: const Duration(milliseconds: 500),
        icon: Icon(Icons.error, color: Resources.color.baseColor, size: 20.0),
      );
      return;
    }
  }
}
