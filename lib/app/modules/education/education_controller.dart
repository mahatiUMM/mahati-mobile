import 'dart:convert';

import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/education_article_model.dart';
import 'package:mahati_mobile/app/core/data/education_brochure_model.dart';
import 'package:mahati_mobile/app/core/data/education_video_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EducationController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;

  RxList<VideoModel> educationVideos = <VideoModel>[].obs;
  RxList<ArticleData> educationArticles = <ArticleData>[].obs;
  RxList<BrochureImage> educationBrochures = <BrochureImage>[].obs;

  var listIndex = 0;

  List<String> educationTab = [
    "Video",
    "Artikel",
    "Brosur",
  ];

  @override
  void onInit() {
    getEducation();
    super.onInit();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  void handleTabSelection(int index) {
    selectedIndex.value = index;
    listIndex = index;
  }

  Future<void> postBookmarkVideo(int id) async {
    try {
      final token = await getToken();
      await restClient.requestWithToken(
          "/bookmark", HttpMethod.POST, {"video_id": id}, token.toString());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      getEducation();
    }
  }

  Future<void> deleteBookmarkVideo(int id) async {
    try {
      final token = await getToken();
      await restClient.requestWithToken(
          "/bookmark/$id", HttpMethod.DELETE, null, token.toString());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      getEducation();
    }
  }

  Future<void> getEducation() async {
    isLoading.value = true;
    final token = await getToken();
    final videos = await restClient.requestWithToken(
        "/video", HttpMethod.GET, null, token.toString());
    final article = await restClient.requestWithToken(
        "/article", HttpMethod.GET, null, token.toString());
    final brochure = await restClient.requestWithToken(
        "/brochure", HttpMethod.GET, null, token.toString());

    if (videos.statusCode == 200) {
      try {
        var videoModel = EducationVideo.fromRawJson(videos.body);
        educationVideos.assignAll(videoModel.data);
      } catch (e) {
        print("Error loading video: $e");
      }
    }

    if (brochure.statusCode == 200) {
      try {
        var brochureModel = Brochure.fromRawJson(brochure.body);
        educationBrochures.assignAll(brochureModel.data);
      } catch (e) {
        print("Error loading brochure: $e");
      }
    }

    if (article.statusCode == 200) {
      try {
        var articleModel = Article.fromRawJson(article.body);
        educationArticles.assignAll(articleModel.data);
      } catch (e) {
        print("Error loading article: $e");
      }
    }
    isLoading.value = false;
  }
}
