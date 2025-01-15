import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class QuestionnaireCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback onPressed;

  const QuestionnaireCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: imageUrl,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            color: const Color(0xFFFFFFFF),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: Get.width * 0.6,
                      child: Text(overflow: TextOverflow.ellipsis, maxLines: 2,
                        title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: Resources.font.primaryFont,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(width: Get.width * 0.6,
                      child: Text(overflow: TextOverflow.ellipsis, maxLines: 6,
                        description,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: Resources.font.primaryFont,
                            color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF40D99E),
                  ),
                  onPressed: onPressed,
                  child: const Text(
                    "Mulai",
                    style: TextStyle(
                      color: Color.fromARGB(255, 24, 82, 60),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
