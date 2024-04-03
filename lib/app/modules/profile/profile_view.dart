import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ProfileView extends GetView {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundHome,
      body: Container(
        child: Text("Profile View"),
      ),
    );
  }
}
