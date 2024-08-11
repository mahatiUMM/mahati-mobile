import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/article/article_list_card.dart';
import 'package:mahati_mobile/app/modules/education/brochure/brochure_thumb_card.dart';
import 'package:mahati_mobile/app/modules/education/education_controller.dart';
import 'package:mahati_mobile/app/modules/education/video/widget/video_list_card.dart';
import 'package:mahati_mobile/app/modules/education/widget/education_tab.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class EducationView extends GetView<EducationController> {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundHome,
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
        title: GestureDetector(
          onTap: () => Get.back(),
          child: Text(
            'Kembali',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: Resources.font.primaryFont,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Resources.color.primaryColor,
        onRefresh: controller.getEducation,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edukasi',
                style: TextStyle(
                  color: const Color(0xFF2C3131),
                  fontSize: 24,
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          final educationTab = controller.educationTab[index];
                          return GestureDetector(
                            onTap: () {
                              controller.handleTabSelection(index);
                            },
                            child: EducationTab(
                              tabName: educationTab,
                              isSelected: controller.selectedIndex == index,
                            ),
                          );
                        });
                      },
                    )),
              ),
              SizedBox(
                height: null,
                child: Obx(() {
                  if (controller.isLoading.isTrue) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final videos = controller.educationVideos;
                    final articles = controller.educationArticles;
                    final brochures = controller.educationBrochures;

                    return Column(children: [
                      SizedBox(
                        child: IndexedStack(
                          index: controller.selectedIndex.toInt(),
                          children: [
                            SizedBox(
                              height: null,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: videos.length,
                                  itemBuilder: (context, index) {
                                    final video = videos[index];
                                    return VideoListCard(
                                        id: video.id,
                                        thumbnailUrl: video.thumbnailUrl,
                                        title: video.title,
                                        summary: video.authorName,
                                        youtubeUrl: video.link,
                                        isBookmarked: video.isBookmarked);
                                  }),
                            ),
                            SizedBox(
                              height: null,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: articles.length,
                                  itemBuilder: (context, index) {
                                    final article = articles[index];
                                    return ArticleListCard(
                                        title: article.title,
                                        summary: article.description,
                                        file: article.file);
                                  }),
                            ),
                            SizedBox(
                              height: null,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: brochures.length,
                                  itemBuilder: (context, index) {
                                    final brochure = brochures[index];
                                    return BrochureThumbCard(
                                        title: brochure.title,
                                        imageUrl: brochure.images
                                            .map((e) => e.imagePath)
                                            .toList());
                                  }),
                            )
                          ],
                        ),
                      ),
                    ]);
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
