import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/education/education_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VideoListCard extends StatelessWidget {
  final EducationController controller = Get.find<EducationController>();
  final int id;
  final String thumbnailUrl;
  final String title;
  final String summary;
  final String youtubeUrl;
  final bool isBookmarked;

  VideoListCard(
      {super.key,
      required this.id,
      required this.thumbnailUrl,
      required this.title,
      required this.summary,
      required this.youtubeUrl,
      required this.isBookmarked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrlString(youtubeUrl),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => isBookmarked
                    ? controller.deleteBookmarkVideo(id)
                    : controller.postBookmarkVideo(id),
                label: isBookmarked ? "Remove Bookmark" : "Add Bookmark",
                icon: isBookmarked
                    ? Icons.bookmark_remove_rounded
                    : Icons.bookmark_add_rounded,
                borderRadius: BorderRadius.circular(18),
                foregroundColor: Resources.color.whiteColor,
                backgroundColor: isBookmarked
                    ? Resources.color.secondaryColor
                    : Resources.color.tertiaryColor2,
              ),
            ],
          ),
          child: Container(
            decoration: ShapeDecoration(
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15), // Shadow color
                    spreadRadius: 8, // Spread radius
                    blurRadius: 12, // Blur radius
                    offset: const Offset(0, 3), // Offset
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                )),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: thumbnailUrl,
                  width: 100,
                  height: 100,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
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
                ),
                Expanded(
                  child: Padding(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
