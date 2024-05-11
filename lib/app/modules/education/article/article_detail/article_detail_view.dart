import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/article/article_detail/article_detail_controller.dart';
import 'package:mahati_mobile/app/modules/education/article/article_list_card.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ArticleDetailView extends GetView<ArticleDetailController> {
  const ArticleDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundHome,
      body: SingleChildScrollView(
        child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: Get.width,
                height: 376,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://img-cdn.medkomtek.com/gI3-RXYeVSRgdvop2RYA_KWWIho=/0x0/smart/filters:quality(100):format(webp)/article/0FJ_hujLjhAi-JVfStt3w/original/xtqwarxi81g1f9z4eti38wq5ba28z0gc.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 320,
                width: Get.width / 1.15,
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 14.80,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '21 Januari 2024',
                              style: TextStyle(
                                color: Color(0xFF9F9F9F),
                                fontSize: 12,
                                fontFamily: Resources.font.primaryFont,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            Text(
                              '#StepUpForKids: odhaiojsd',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: Resources.font.primaryFont,
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Text(
                                '<p>doashjnidojasojnd</p><br/><p>loremipsumdoretamesss</p><p>doashjnidojasojnd</p><br/><p>loremipsumdoretamesss</p><p>doashjnidojasojnd</p><br/><p>loremipsumdoretamesss</p>',
                                style: TextStyle(
                                  color: Color(0xFF9F9F9F),
                                  fontSize: 12,
                                  fontFamily: Resources.font.primaryFont,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 24.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Artikel lainnya',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: Resources.font.primaryFont,
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                            ),
                            const ArticleListCard(
                                thumbnailUrl:
                                    "https://img-cdn.medkomtek.com/gI3-RXYeVSRgdvop2RYA_KWWIho=/0x0/smart/filters:quality(100):format(webp)/article/0FJ_hujLjhAi-JVfStt3w/original/xtqwarxi81g1f9z4eti38wq5ba28z0gc.png",
                                title: "Diabetes",
                                summary: "Gejala, Diagnosis & Cara Pengobatan"),
                            const ArticleListCard(
                                thumbnailUrl:
                                    "https://img-cdn.medkomtek.com/gI3-RXYeVSRgdvop2RYA_KWWIho=/0x0/smart/filters:quality(100):format(webp)/article/0FJ_hujLjhAi-JVfStt3w/original/xtqwarxi81g1f9z4eti38wq5ba28z0gc.png",
                                title: "Diabetes",
                                summary: "Gejala, Diagnosis & Cara Pengobatan"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
