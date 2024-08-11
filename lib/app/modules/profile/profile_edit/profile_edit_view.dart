import 'package:cached_network_image/cached_network_image.dart';
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
                        radius: 62,
                        backgroundColor: Colors.grey[200],
                        child:
                            controller.profileController.photo.value.isNotEmpty
                                ? CachedNetworkImage(
                                    imageUrl:
                                        'https://mahati.xyzuan.my.id/${controller.profileController.photo.value}',
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                    imageBuilder: (context, imageProvider) =>
                                        CircleAvatar(
                                      radius: 70,
                                      backgroundColor: Colors.grey[200],
                                      backgroundImage: imageProvider,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.grey[200],
                                  ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          color: Colors.white,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.black,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(99),
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Icons.edit,
                            size: 24,
                          ),
                          onPressed: () => showImagePicker(
                            context,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20),
              Column(
                children: [
                  LabelField(
                    label: 'Username',
                    value: "",
                    controller: controller.usernameController,
                    isNumber: false,
                  ),
                  LabelField(
                    label: 'Email',
                    value: "",
                    controller: controller.emailController,
                    isNumber: false,
                  ),
                  LabelField(
                    label: 'Nomor Handphone',
                    value: "",
                    controller: controller.numberController,
                    isNumber: true,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.updateProfile(
                      controller.usernameController.text,
                      controller.emailController.text,
                      controller.numberController.text,
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
