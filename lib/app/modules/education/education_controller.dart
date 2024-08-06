import 'package:get/get.dart';
import 'package:mahati_mobile/app/core/data/education_brochure_model.dart';
import 'package:mahati_mobile/app/core/data/education_video_model.dart';
import 'package:mahati_mobile/app/core/network/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EducationController extends GetxController {
  final RestClient restClient = Get.find<RestClient>();
  RxInt selectedIndex = 0.obs;

  RxList<VideoModel> educationVideo = <VideoModel>[].obs;
  RxList<BrochureImage> brochures = RxList<BrochureImage>([]);

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

  Future<void> getEducation() async {
    final token = await getToken();
    final videos = await restClient.requestWithToken(
        "/video", HttpMethod.GET, null, token.toString());
    final brochure = await restClient.requestWithToken(
        "/brochure", HttpMethod.GET, null, token.toString());

    if (videos.statusCode == 200) {
      var videoModel = EducationVideo.fromRawJson(videos.body);
      educationVideo.assignAll(videoModel.data);
    } else {}

    if (brochure.statusCode == 200) {
      try {
        var brochureModel = Brochure.fromRawJson(brochure.body);

        brochures.assignAll(brochureModel.data);
      } catch (e) {
        print("Error loading brochure: $e");
      }
    } else {}
  }
}
