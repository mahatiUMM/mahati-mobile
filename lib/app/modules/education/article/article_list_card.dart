import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/article/article_detail/article_detail_binding.dart';
import 'package:mahati_mobile/app/modules/education/article/article_detail/article_detail_view.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ArticleListCard extends StatelessWidget {
  final String title;
  final String summary;
  final String file;

  const ArticleListCard({
    super.key,
    required this.title,
    required this.summary,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => const ArticleDetailView(),
          binding: ArticleDetailBinding(title: title, file: file),
        );
      },
      child: Card(
        color: Resources.color.whiteColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: const PDF(
                pageFling: false,
                enableSwipe: false,
                pageSnap: false,
                defaultPage: 1,
                preventLinkNavigation: true,
              ).cachedFromUrl(
                'https://mahati.xyzuan.my.id/$file',
                placeholder: (progress) => Center(
                  child: LinearProgressIndicator(
                    color: Resources.color.primaryColor.withAlpha(100),
                    backgroundColor: Resources.color.primaryColor.withAlpha(30),
                  ),
                ),
                errorWidget: (error) => Center(child: Text(error.toString())),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    summary,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
