import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

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
      child: Column(
        children: [
          Column(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: ShapeDecoration(
                  color: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 75,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          )
        ],
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
            color: const Color(0xFFE8CB64),
            onClick: () {
              print("Pengingat");
            },
          ),
          const SizedBox(width: 23),
          TabItem(
            title: 'Tekanan Darah',
            color: const Color(0xFFE87E6E),
            onClick: () {
              Get.toNamed('/pressure');
            },
          ),
          const SizedBox(width: 23),
          TabItem(
            title: 'Edukasi',
            color: const Color(0xFF4A87D8),
            onClick: () {
              Get.toNamed('/education');
            },
          ),
          const SizedBox(width: 23),
          TabItem(
            title: 'Kuesioner',
            color: const Color(0xFF40D99E),
            onClick: () {
              print("Kuesioner");
            },
          ),
        ],
      ),
    );
  }
}
