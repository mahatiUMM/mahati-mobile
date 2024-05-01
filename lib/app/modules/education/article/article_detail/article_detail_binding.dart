import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/article/article_detail/article_detail_controller.dart';

class ArticleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ArticleDetailController());
  }
}
