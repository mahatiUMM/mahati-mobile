import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/profile_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileEditController extends GetxController {
  Rx<File?> image = Rx<File?>(null);
  var username = Rx<String>('');
  var email = Rx<String>('');
  var number = Rx<String>('');

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

  Future<int> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return int.parse(prefs.getString('userId')!);
  }

  Future<void> getProfileData() async {
    final token = await getToken();
    final restClient = Get.find<RestClient>();

    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.GET, null, token.toString());

    var responseData = UserModel.fromJson(jsonDecode(result.body));

    username.value = responseData.username;
    email.value = responseData.email;
    number.value = responseData.number;

    usernameController.text = responseData.username;
    emailController.text = responseData.email;
    numberController.text = responseData.number;
  }

  Future<void> updateProfile(String name, String email, String number) async {
    final token = await getToken();
    final restClient = Get.find<RestClient>();
    final userId = await getUserId();

    final data = {
      "id": userId,
      "username": name,
      "email": email,
      "number": number,
      "photo": ""
    };

    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.PUT, data, token.toString());

    if (result.statusCode == 200) {
    } else {
      print('Request failed with status: ${result.statusCode}');
    }
  }
}
