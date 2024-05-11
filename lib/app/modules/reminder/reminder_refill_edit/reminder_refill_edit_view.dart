import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ReminderRefillEditView extends GetView {
  const ReminderRefillEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark),
            expandedHeight: 275,
            backgroundColor: Resources.color.whiteColor,
            elevation: 0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/refill_header.png",
                fit: BoxFit.cover,
              ),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Resources.color.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0),
                  ),
                ),
                child: Container(
                  width: 40.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Resources.color.baseColor,
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                ),
              ),
            ),
            leadingWidth: Get.width,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.chevron_left,
                      color: Resources.color.baseColor,
                    ),
                    Text(
                      "Kembali",
                      style: TextStyle(
                        fontFamily: Resources.font.primaryFont,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Resources.color.whiteColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      children: [
                        Text("Refill Edit"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
