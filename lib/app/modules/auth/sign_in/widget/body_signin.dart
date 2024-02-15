import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BodySignIn extends GetView {
  const BodySignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 541,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
