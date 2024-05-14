import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget reminderRefillCard({String? title, String? left, String? refill}) {
  return Card(
    color: Resources.color.whiteColor,
    margin: const EdgeInsets.only(top: 20),
    elevation: 0,
    shadowColor: Resources.color.whiteColor,
    surfaceTintColor: Resources.color.whiteColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
            image: DecorationImage(
              image: NetworkImage(
                  "https://www.who.int/images/default-source/wpro/countries/viet-nam/health-topics/thuoc-thiet-yeu.tmb-1024v.jpg?Culture=en&sfvrsn=a0b4a101_16"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
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
                Text(
                  left ?? "",
                  style: TextStyle(
                    color: Resources.color.baseColor,
                    fontSize: 16,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Text(
                  refill ?? "",
                  style: TextStyle(
                    color: Resources.color.baseColor,
                    fontSize: 16,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            print("Add refill");
          },
          icon: Icon(
            Icons.add,
            color: Resources.color.baseColor,
            size: 30,
          ),
        )
      ],
    ),
  );
}
