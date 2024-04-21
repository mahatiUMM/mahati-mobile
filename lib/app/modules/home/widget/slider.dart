import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget sliderWidget() {
  return Container(
    width: 350,
    height: 200,
    decoration: ShapeDecoration(
      color: Resources.color.baseColor2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
