import 'package:get/get.dart';

class EducationController extends GetxController {
  RxInt selectedIndex = 0.obs;
  var listIndex = 0;

  List<String> educationTab = [
    "Video",
    "Artikel",
    "Brosur",
  ];

  void handleTabSelection(int index) {
    selectedIndex.value = index;
    listIndex = index;
  }
}
