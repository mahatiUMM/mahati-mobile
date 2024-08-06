import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VideoListCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String summary;
  final String youtubeUrl;

  const VideoListCard({
    Key? key,
    required this.thumbnailUrl,
    required this.title,
    required this.summary,
    required this.youtubeUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrlString(youtubeUrl),
      child: Card(
        color: Resources.color.whiteColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: thumbnailUrl,
              width: 100,
              height: 100,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
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
    );
  }
}
