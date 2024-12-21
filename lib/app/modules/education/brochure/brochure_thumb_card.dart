import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/brochure/brochure_detail/brochure_detail_binding.dart';
import 'package:mahati_mobile/app/modules/education/brochure/brochure_detail/brochure_detail_view.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class BrochureThumbCard extends StatelessWidget {
  final String title;
  final List<String> imageUrl;

  const BrochureThumbCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (imageUrl.isNotEmpty)
          {
            Get.to(
              () => const BrochureDetailView(),
              binding: BrochureDetailBinding(
                title: title,
                imageUrl: imageUrl,
              ),
            )
          }
        else
          {
            // Handle case where imageUrl is empty
            Get.snackbar(
              'No Images',
              'There are no images available for this brochure.',
              snackPosition: SnackPosition.BOTTOM,
            )
          }
      },
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl.isNotEmpty)
              CachedNetworkImage(
                imageUrl: 'https://mahati.xyzuan.my.id/${imageUrl[0]}',
                height: 150,
                width: double.infinity,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => LinearProgressIndicator(
                  color: Resources.color.primaryColor.withAlpha(100),
                  backgroundColor: Resources.color.primaryColor.withAlpha(30),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )
            else
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[200],
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: Resources.font.primaryFont,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
