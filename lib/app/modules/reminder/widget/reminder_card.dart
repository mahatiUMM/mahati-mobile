import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget reminderCard(
    {String? title, String? status, String? strong, String? time}) {
  return Card(
    color: Resources.color.whiteColor,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
            image: DecorationImage(
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/SMPTE_Color_Bars.svg/1200px-SMPTE_Color_Bars.svg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "",
                style: TextStyle(
                  color: Resources.color.baseColor,
                  fontSize: 16,
                  fontFamily: Resources.font.primaryFont,
                  fontWeight: FontWeight.w800,
                  height: 0,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff4ECB71),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 170,
                    height: 25,
                    child: Center(
                      child: Text(
                        status ?? "",
                        style: TextStyle(
                          color: Resources.color.whiteColor,
                          fontSize: 12,
                          fontFamily: Resources.font.primaryFont,
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Resources.color.tertiaryColor1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100,
                    height: 25,
                    child: Center(
                      child: Text(
                        strong ?? "",
                        style: TextStyle(
                          color: Resources.color.whiteColor,
                          fontSize: 12,
                          fontFamily: Resources.font.primaryFont,
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Resources.color.secondaryColor2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 100,
                    height: 25,
                    child: Center(
                      child: Text(
                        time ?? "",
                        style: TextStyle(
                          color: Resources.color.whiteColor,
                          fontSize: 12,
                          fontFamily: Resources.font.primaryFont,
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}
