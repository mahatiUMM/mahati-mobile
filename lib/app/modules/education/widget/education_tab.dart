import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class EducationTab extends StatefulWidget {
  final String tabName;
  final bool isSelected;

  const EducationTab({
    super.key,
    required this.tabName,
    this.isSelected = false,
  });

  @override
  _EducationTabState createState() => _EducationTabState();
}

class _EducationTabState extends State<EducationTab> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 7),
          decoration: ShapeDecoration(
            color: widget.isSelected
                ? Resources.color.primaryColor
                : const Color(0xFFEEEEEE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                widget.tabName,
                style: TextStyle(
                    color: widget.isSelected
                        ? Resources.color.whiteColor
                        : Resources.color.baseColor2,
                    fontFamily: Resources.font.primaryFont,
                    fontSize: 14,
                    fontWeight: widget.isSelected
                        ? FontWeight.w600
                        : FontWeight.normal),
              )),
        )
      ],
    );
  }
}
