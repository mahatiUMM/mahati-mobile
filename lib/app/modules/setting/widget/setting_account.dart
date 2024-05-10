import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget settingAccount() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 25),
      Text(
        "Akun",
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
          print("Ubah Profil");
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
              Icons.person_2_outlined,
              color: Resources.color.baseColor,
            ),
            const SizedBox(width: 10),
            Text(
              'Ubah Profil',
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
          print("Notifikasi");
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
              Icons.notifications_active_outlined,
              color: Resources.color.baseColor,
            ),
            const SizedBox(width: 10),
            Text(
              'Notifikasi',
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
          print("Privasi");
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
              Icons.privacy_tip_outlined,
              color: Resources.color.baseColor,
            ),
            const SizedBox(width: 10),
            Text(
              'Privasi',
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
