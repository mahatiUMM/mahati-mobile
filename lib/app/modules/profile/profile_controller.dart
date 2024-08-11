import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/education_video_model.dart';
import 'package:mahati_mobile/app/core/data/profile_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/routes/app_pages.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

class ProfileController extends GetxController {
  final SharedPreferences _prefs = Get.find<SharedPreferences>();
  final restClient = Get.find<RestClient>();

  RxList<ProfileModel> profileModel = <ProfileModel>[].obs;
  RxList<VideoModel> educationVideos = <VideoModel>[].obs;
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString photo = ''.obs;

  late UserModel profileModelObj;

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  Future<void> fetchProfile() async {
    getUserProfile();
    getBookmarkVideo();
  }

  Future<void> getUserProfile() async {
    final token = await getToken();

    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.GET, null, token.toString());

    var responseData = UserModel.fromJson(jsonDecode(result.body));
    username.value = responseData.username;
    email.value = responseData.email;
    phone.value = responseData.number;
    photo.value = responseData.photo;
  }

  Future<void> getBookmarkVideo() async {
    try {
      final token = await getToken();
      final response = await restClient.requestWithToken(
          "/video_bookmarked", HttpMethod.GET, null, token.toString());

      if (response.statusCode == 200) {
        try {
          var videoModel = EducationVideo.fromRawJson(response.body);
          educationVideos.assignAll(videoModel.data);
        } catch (e) {
          print("Error loading video: $e");
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> exportUserVideos() async {
    final token = await getToken();
    final restClient = Get.find<RestClient>();
    final result = await restClient.requestWithToken(
      "/export/video",
      HttpMethod.GET,
      null,
      token.toString(),
    );

    final directory = Directory("/storage/emulated/0/Download");
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    final filePath = path.join(
      directory.path,
      "exported_videos-${DateTime.now().millisecondsSinceEpoch}.xlsx",
    );
    final file = File(filePath);
    await file.writeAsBytes(result.bodyBytes);
    Get.snackbar(
      "Export Data Video",
      "Berhasil, file tersimpan di Download",
      backgroundColor: Resources.color.primaryColor,
      colorText: Resources.color.whiteColor,
    );
  }

  void logout() {
    _prefs.remove('user_token');
    Get.offAllNamed(Routes.signin);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }
}
