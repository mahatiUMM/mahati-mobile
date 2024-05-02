import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/brochure/brochure_detail/brochure_detail_controller.dart';

class BrochureDetailBinding extends Bindings {
  final String title;
  final List<String> imageUrl;

  BrochureDetailBinding({
    required this.title,
    required this.imageUrl,
  });

  @override
  void dependencies() {
    Get.lazyPut<BrochureDetailController>(() => BrochureDetailController(
          title: title,
          imageUrl: imageUrl,
        ));
  }
}
