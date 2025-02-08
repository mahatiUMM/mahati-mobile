import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget pressureDetailBottomSheet({
  required String systolic,
  required String diastolic,
  required String pulse,
  required String image,
}) {
  return Container(
    width: Get.width,
    padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40.0,
              height: 5.0,
              decoration: BoxDecoration(
                color: Resources.color.baseColor,
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: Text(
            "Detail Tekanan Darah",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Container(
            height: 290,
            width: Get.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[200]!,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: image.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: dotenv.get('IMAGE_URL')+image,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const Center(
                      child: Text(
                        "Image Not Available",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Resources.color.primaryColor),
                      ),
                    ),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : (const Center(
                    child: Text(
                      "Image Not Available",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  )),
          ),
        ),
        ElevatedButton(
            onPressed: () => Get.back(),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                Size(Get.width, 40),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Resources.color.primaryColor),
            ),
            child: Text(
              "Kembali",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: Resources.font.primaryFont,
              ),
            )),
      ],
    ),
  );
}
