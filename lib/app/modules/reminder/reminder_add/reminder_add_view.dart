import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ReminderAddView extends GetView {
  const ReminderAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
            ),
            expandedHeight: 275,
            backgroundColor: Resources.color.whiteColor,
            elevation: 0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/reminder_add.png",
                fit: BoxFit.cover,
              ),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
            ),
          )
        ],
      ),
    );
  }
}
