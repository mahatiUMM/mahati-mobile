import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/article/article_detail/article_detail_controller.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ArticleDetailView extends GetView<ArticleDetailController> {
  const ArticleDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundHome,
          surfaceTintColor: AppColors.backgroundHome,
          elevation: 0,
          leadingWidth: 20,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            controller.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: const PDF(pageFling: true).cachedFromUrl(
          dotenv.get('IMAGE_URL') + controller.file,
          placeholder: (progress) =>
              Center(child: CircularProgressIndicator(value: progress)),
          errorWidget: (error) => Center(child: Text(error.toString())),
        ));
  }
}
