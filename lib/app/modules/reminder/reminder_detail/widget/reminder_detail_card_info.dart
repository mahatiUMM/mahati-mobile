import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget buildInfoCard({required String title, required Widget value}) {
  return Flexible(
    child: Card(
      color: Resources.color.textFieldColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 150,
        height: 75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Resources.color.baseColor,
                fontSize: 14,
                fontFamily: Resources.font.primaryFont,
                fontWeight: FontWeight.w800,
                height: 0,
              ),
            ),
            const SizedBox(height: 5),
            value,
          ],
        ),
      ),
    ),
  );
}
