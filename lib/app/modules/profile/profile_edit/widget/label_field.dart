import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LabelField extends GetView {
  const LabelField({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 5),
        // make a textfield
        TextField(
          decoration: InputDecoration(
            hintText: value,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
