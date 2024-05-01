import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/profile/profile_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundHome,
      body: Container(
        child: Column(
          children: [
            Text("Profile View"),
            ElevatedButton(
                onPressed: () {
                  controller.printToken();
                },
                child: Text("Get Token"))
          ],
        ),
      ),
    );
  }
}
