import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
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

  final _storage = GetStorage();
  final _picker = ImagePicker();

  RxList<ProfileModel> profileModel = <ProfileModel>[].obs;
  RxList<VideoModel> educationVideos = <VideoModel>[].obs;

  RxBool isLoggedIn = false.obs;
  Rx<File?> image = Rx<File?>(null);

  late UserModel profileModelObj;
  final storage = GetStorage();
  var username = Rx<String>('');
  var itemCount = 0.obs;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      _storage.write('imagePath', pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> fetchProfile() async {
    getUserProfile();
    getBookmarkVideo();
  }

  @override
  void onInit() {
    super.onInit();
    // Load stored image path if available
    String? savedImagePath = _storage.read('imagePath');
    if (savedImagePath != null) {
      image.value = File(savedImagePath);
    }
  }

  void logout() {
    _prefs.remove('user_token');
    Get.offAllNamed(Routes.signin);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  Future<void> getBookmarkVideo() async {
    try {
      final token = await getToken();
      final response = await restClient.requestWithToken(
          "/video_bookmarked", HttpMethod.GET, null, token.toString());

      if (response.statusCode == 200) {
        try {
          print(response.body);

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

  Future<void> getUserProfile() async {
    final token = await getToken();

    final result = await restClient.requestWithToken(
        "/profile", HttpMethod.GET, null, token.toString());

    var responseData = UserModel.fromJson(jsonDecode(result.body));
    username.value = responseData.username;
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

  addNewProfile(String name, String bio) async {
    profileModelObj = UserModel(
      id: "",
      email: "",
      number: "",
      password: "",
      photo: "",
      username: "",
    );
    await storage.write("nama", name);
    itemCount.value = profileModel.value.length;
    storage.write("totalItem", itemCount.value);
  }

  removeProfile(int index) {
    profileModel.value.removeAt(index);
    itemCount.value = profileModel.value.length;
  }
}
