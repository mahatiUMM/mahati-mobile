import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/setting/widget/setting_account.dart';
import 'package:mahati_mobile/app/modules/setting/widget/setting_action.dart';
import 'package:mahati_mobile/app/modules/setting/widget/setting_help.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class SettingView extends GetView {
  const SettingView({super.key});

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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
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
              Text(
                "Pengaturan",
                style: TextStyle(
                  color: Resources.color.baseColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontFamily: Resources.font.primaryFont,
                ),
              ),
              settingAccount(),
              settingHelp(),
              settingAction(),
            ],
          ),
        ),
      ),
    );
  }
}
