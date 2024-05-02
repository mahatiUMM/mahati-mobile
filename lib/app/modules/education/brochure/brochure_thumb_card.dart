import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/brochure/brochure_detail/brochure_detail_binding.dart';
import 'package:mahati_mobile/app/modules/education/brochure/brochure_detail/brochure_detail_view.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class BrochureThumbCard extends StatelessWidget {
  final String title;
  final List<String> imageUrl;

  const BrochureThumbCard({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Get.to(
          () => const BrochureDetailView(),
          binding: BrochureDetailBinding(
            title: title,
            imageUrl: imageUrl,
          ),
        )
      },
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl[0],
              fit: BoxFit.cover,
              height: 150,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
