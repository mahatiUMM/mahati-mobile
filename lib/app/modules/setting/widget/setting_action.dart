import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget settingACtion() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 25),
      Text(
        "Aksi",
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
          print("Laporankan Masalah");
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
              Icons.report_problem_outlined,
              color: Resources.color.baseColor,
            ),
            const SizedBox(width: 10),
            Text(
              'Laporankan Masalah',
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
          print("Hapus Akun");
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
              Icons.delete_outline,
              color: Resources.color.baseColor,
            ),
            const SizedBox(width: 10),
            Text(
              'Hapus Akun',
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
          print("Keluar Akun");
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
              Icons.logout_outlined,
              color: Resources.color.baseColor,
            ),
            const SizedBox(width: 10),
            Text(
              'Keluar Akun',
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
