import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget settingHelp() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 25),
      Text(
        "Bantuan & Tentang",
        style: TextStyle(
          color: Resources.color.baseColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: Resources.font.primaryFont,
        ),
      ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          print("Bantu dan Dukung");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Resources.color.whiteColor,
          elevation: 0,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.help_outline,
              color: Resources.color.baseColor,
            ),
            const SizedBox(width: 10),
            Text(
              'Bantu dan Dukung',
              style: TextStyle(
                color: Resources.color.baseColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          print("Istilah dan Kebijakan");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Resources.color.whiteColor,
          elevation: 0,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.policy_outlined,
              color: Resources.color.baseColor,
            ),
            const SizedBox(width: 10),
            Text(
              'Istilah dan Kebijakan',
              style: TextStyle(
                color: Resources.color.baseColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          print("Tentang MAHATi");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Resources.color.whiteColor,
          elevation: 0,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: Resources.color.baseColor,
            ),
            const SizedBox(width: 10),
            Text(
              'Tentang MAHATI',
              style: TextStyle(
                color: Resources.color.baseColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
