import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabItem extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onClick;

  const TabItem({
    Key? key,
    required this.title,
    required this.color,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: SizedBox(
        width: 58,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 68,
              child: SizedBox(
                width: 58,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 58,
                height: 58,
                decoration: ShapeDecoration(
                  color: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBox extends StatelessWidget {
  const TabBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 98,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabItem(
            title: 'Pengingat',
            color: Color(0xFFE8CB64),
            onClick: () {
              print("Pengingat");
            },
          ),
          SizedBox(width: 23),
          TabItem(
            title: 'Tekanan Darah',
            color: Color(0xFFE87E6E),
            onClick: () {
              print("Tekanan Darah");
            },
          ),
          SizedBox(width: 23),
          TabItem(
            title: 'Edukasi',
            color: Color(0xFF4A87D8),
            onClick: () {
              print("Edukasi");
            },
          ),
          SizedBox(width: 23),
          TabItem(
            title: 'Kuesioner',
            color: Color(0xFF40D99E),
            onClick: () {
              print("Kuesioner");
            },
          ),
        ],
      ),
    );
  }
}
