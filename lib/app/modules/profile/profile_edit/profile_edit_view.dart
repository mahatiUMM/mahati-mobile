import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/profile/profile_edit/profile_edit_controller.dart';
import 'package:mahati_mobile/app/modules/profile/profile_edit/widget/label_field.dart';
import 'package:mahati_mobile/app/modules/profile/widget/image_picker.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ProfileEditView extends GetView<ProfileEditController> {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Kembali',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Ubah Profil Saya",
                  style: TextStyle(
                    color: Resources.color.baseColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontFamily: Resources.font.primaryFont,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                return Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: controller.image.value != null
                            ? FileImage(controller.image.value!)
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: -10,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 5.0),
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera,
                              size: 36,
                            ),
                            onPressed: () => showImagePicker(
                              context,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20),
              Obx(
                () => Column(
                  children: [
                    (controller.username.value == "")
                        ? const Center(child: CircularProgressIndicator())
                        : LabelField(
                            label: 'Username',
                            value: controller.username.value),
                    LabelField(label: 'Email', value: controller.email.value),
                    const LabelField(label: 'Password', value: "**********"),
                    LabelField(
                        label: 'Nomor Handphone',
                        value: controller.number.value),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.updateProfile(
                      controller.username.value,
                      controller.email.value,
                      controller.password.value,
                      controller.number.value,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Resources.color.primaryColor,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Simpan Perubahan',
                    style: TextStyle(
                      color: Resources.color.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
