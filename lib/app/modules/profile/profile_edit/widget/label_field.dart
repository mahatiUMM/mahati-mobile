import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class LabelField extends GetView {
  const LabelField({
    super.key,
    required this.label,
    required this.value,
    required this.isNumber,
    required this.controller,
  });

  final String label;
  final String value;
  final bool isNumber;

  @override
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          cursorColor: Resources.color.baseColor,
          decoration: InputDecoration(
            fillColor: Colors.grey[100],
            filled: true,
            hintText: value,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Resources.color.hintColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.grey[100]!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.grey[100]!,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
