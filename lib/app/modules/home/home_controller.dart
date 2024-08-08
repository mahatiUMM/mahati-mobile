import 'dart:convert';

import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/education_video_model.dart';
import 'package:mahati_mobile/app/core/data/user_dashboard_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:mahati_mobile/app/core/data/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  var tabIndex = 0;
  var username = Rx<String>('');

  RxBool isDashboardLoading = false.obs;
  RxBool isEducationLoading = false.obs;

  RxList<VideoModel> educationVideos = <VideoModel>[].obs;
  RxList<LowerMedicine> lowerMedicine = <LowerMedicine>[].obs;
  RxString remainingMedicine = ''.obs;
  RxString recentSystolic = ''.obs;
  RxString recentDiastole = ''.obs;
  RxString recentPulse = ''.obs;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void onInit() {
    getAllDashboard();
    super.onInit();
  }

  Future<void> getAllDashboard() async {
    getUserProfile();
    getUserDashboard();
    getRecentEducation();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> getUserDashboard() async {
    isDashboardLoading.value = true;
    final token = await getToken();
    final restClient = Get.find<RestClient>();
    final result = await restClient.requestWithToken(
        "/dashboard", HttpMethod.GET, null, token.toString());

    if (result.statusCode == 200) {
      var responseData = UserDashboard.fromJson(jsonDecode(result.body));
      remainingMedicine.value = responseData.data.remainingMedicine.toString();
      lowerMedicine.value = responseData.data.lowerMedicine;
      recentSystolic.value =
          responseData.data.recentBloodPressure.sistol.toString();
      recentDiastole.value =
          responseData.data.recentBloodPressure.diastole.toString();
      recentPulse.value =
          responseData.data.recentBloodPressure.heartbeat.toString();
    }
    isDashboardLoading.value = false;
  }

  Future<void> getRecentEducation() async {
    isDashboardLoading.value = true;
    final token = await getToken();
    final videos = await restClient.requestWithToken(
        "/video", HttpMethod.GET, null, token.toString());

    if (videos.statusCode == 200) {
      try {
        var videoModel = EducationVideo.fromRawJson(videos.body);
        educationVideos.assignAll(videoModel.data);
      } catch (e) {
        print("Error loading video: $e");
      }
    }
    isDashboardLoading.value = false;
  }

  Future<void> getUserProfile() async {
    final token = await getToken();
    final restClient = Get.find<RestClient>();
    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.GET, null, token.toString());
    var responseData = UserModel.fromJson(jsonDecode(result.body));
    username.value = responseData.username;
  }
}
