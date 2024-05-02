import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/brochure/brochure_detail/brochure_detail_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BrochureDetailView extends GetView<BrochureDetailController> {
  const BrochureDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {
                // Add your action here
              },
            ),
          ],
          elevation: 0,
          leadingWidth: 8,
          leading: const SizedBox.shrink(),
          title: Text(
            controller.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: CarouselSlider(
          options: CarouselOptions(
              height: Get.height,
              enableInfiniteScroll: false,
              viewportFraction: 1),
          items: controller.imageUrl.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  child: Image.network(
                    i,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            );
          }).toList(),
        ));
  }
}
