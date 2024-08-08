import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class TabItem extends StatelessWidget {
  final String title;
  final Color color;
  final Icon icon;
  final VoidCallback? onClick;

  const TabItem({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
    this.onClick,
  });

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
                child: icon,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabItem(
            title: 'Pengingat',
            color: const Color(0xFFE8CB64),
            icon: const Icon(
              FontAwesomeIcons.solidBell,
              color: Colors.white,
            ),
            onClick: () {
              Get.toNamed('/reminder');
            },
          ),
          TabItem(
            title: 'Tekanan Darah',
            color: const Color(0xFFE87E6E),
            icon: const Icon(
              FontAwesomeIcons.heartPulse,
              color: Colors.white,
            ),
            onClick: () {
              Get.toNamed('/pressure');
            },
          ),
          TabItem(
            title: 'Edukasi',
            color: const Color(0xFF4A87D8),
            icon: const Icon(
              FontAwesomeIcons.bookOpen,
              color: Colors.white,
            ),
            onClick: () {
              Get.toNamed('/education');
            },
          ),
          TabItem(
            title: 'Kuesioner',
            color: const Color(0xFF40D99E),
            icon: const Icon(
              FontAwesomeIcons.fileCircleQuestion,
              color: Colors.white,
            ),
            onClick: () {
              Get.toNamed('/questionnaire');
            },
          ),
        ],
      ),
    );
  }
}
