import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/layout/layout_controller.dart';
import 'package:mahati_mobile/app/constants/text_strings.dart';
import 'package:mahati_mobile/app/constants/text_style.dart';

class GreetingWidget extends StatelessWidget {
  final LayoutController controller;
  final String username;
  final String image;

  const GreetingWidget({
    super.key,
    required this.controller,
    required this.username,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 30.0, right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed('/reminder/action'),
                    child: Text(
                      'Hai, $username',
                      overflow: TextOverflow.ellipsis,
                      style: StyleText.homeGreeting1,
                    ),
                  ),
                  Text(
                    TextStrings.homeGreeting,
                    style: StyleText.homeGreeting2,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => controller.changeTabIndex(3),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey[200],
              child: image.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: dotenv.get('IMAGE_URL')+image,
                      placeholder: (context, url) => CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.grey[200],
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 24,
                      ),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: imageProvider,
                      ),
                    )
                  : CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey[200],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
