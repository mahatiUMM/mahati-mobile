import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_detail/reminder_detail_controller.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_detail/widget/reminder_detail_card_section.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ReminderDetailView extends GetView<ReminderDetailController> {
  const ReminderDetailView({super.key});

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
                "assets/images/reminder_detail.png",
                fit: BoxFit.cover,
              ),
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
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
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.chevron_left,
                          color: Resources.color.baseColor,
                        ),
                        const Text(
                          'Kembali',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showMenu(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      context: context,
                      color: Resources.color.whiteColor,
                      shadowColor: Resources.color.whiteColor,
                      surfaceTintColor: Resources.color.whiteColor,
                      elevation: 0,
                      position: const RelativeRect.fromLTRB(100, 100, 0, 100),
                      items: [
                        PopupMenuItem(
                          child: ListTile(
                            leading: const Icon(Icons.edit),
                            title: const Text('Edit Pengingat'),
                            onTap: () {
                              Get.toNamed('/reminder/edit');
                            },
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: const Icon(Icons.delete),
                            title: const Text("Hapus pengingat"),
                            onTap: () {
                              Get.generalDialog(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return AlertDialog(
                                    backgroundColor: Resources.color.whiteColor,
                                    title: Text(
                                      "Hapus Pengingat",
                                      style: TextStyle(
                                        color: Resources.color.baseColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    content: Text(
                                      "Apakah anda yakin ingin menghapus pengingat ini?",
                                      style: TextStyle(
                                        color: Resources.color.baseColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          "Batal",
                                          style: TextStyle(
                                            color: Resources.color.baseColor,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                          print("Deleted");
                                        },
                                        child: Text(
                                          "Hapus",
                                          style: TextStyle(
                                            color:
                                                Resources.color.secondaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Resources.color.whiteColor,
                  height: Get.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            controller.reminderModel.value?.data.medicineName ??
                                "Loading...",
                            style: TextStyle(
                              color: Resources.color.baseColor,
                              fontSize: 20,
                              fontFamily: Resources.font.primaryFont,
                              fontWeight: FontWeight.w800,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildCardSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
