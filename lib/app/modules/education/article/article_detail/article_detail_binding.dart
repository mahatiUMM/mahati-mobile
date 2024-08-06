import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/article/article_detail/article_detail_controller.dart';

class ArticleDetailBinding extends Bindings {
  final String title;
  final String file;

  ArticleDetailBinding({
    required this.title,
    required this.file,
  });

  @override
  void dependencies() {
    Get.lazyPut<ArticleDetailController>(() => ArticleDetailController(
          title: title,
          file: file,
        ));
  }
}
