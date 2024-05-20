import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refiil/reminder_refill_controller.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refiil/widget/reminder_refill_card.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refiil/widget/reminder_refill_form.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ReminderRefillView extends GetView<ReminderRefillController> {
  const ReminderRefillView({super.key});

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
                "assets/images/refill_header.png",
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
                      context: context,
                      color: Theme.of(context).cardColor,
                      shadowColor: Theme.of(context).shadowColor,
                      surfaceTintColor: Theme.of(context).canvasColor,
                      elevation: 0,
                      position: const RelativeRect.fromLTRB(100, 100, 0, 100),
                      items: [
                        PopupMenuItem(
                          child: ListTile(
                            leading: const Icon(Icons.edit),
                            title: const Text('Edit'),
                            onTap: () {
                              Get.toNamed('/reminder/refill/edit');
                            },
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: const Icon(Icons.delete),
                            title: const Text('Hapus'),
                            onTap: () {
                              Get.defaultDialog(
                                backgroundColor: Resources.color.whiteColor,
                                title: 'Hapus Pengingat',
                                middleText:
                                    'Apakah Anda yakin ingin menghapus pengingat ini?',
                                textConfirm: 'Ya',
                                buttonColor: Resources.color.baseColor,
                                cancelTextColor: Resources.color.secondaryColor,
                                textCancel: 'Tidak',
                                confirmTextColor: Resources.color.whiteColor,
                                onConfirm: () {
                                  Get.back();
                                },
                                onCancel: () {
                                  Get.back();
                                },
                                onWillPop: () async {
                                  return false;
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Tambah Obat',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            fontFamily: Resources.font.primaryFont,
                          ),
                        ),
                        reminderRefillForm(context),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Rekomendasi Obat",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            fontFamily: Resources.font.primaryFont,
                          ),
                        ),
                        reminderRefillCard(
                          title: "Paxil CR",
                          left: "Sisa 2 pills",
                          refill: "Isi ulang selanjutnya: Mon, May 28",
                        ),
                        reminderRefillCard(
                          title: "Paxil CR",
                          left: "Sisa 2 pills",
                          refill: "Isi ulang selanjutnya: Mon, May 28",
                        ),
                        reminderRefillCard(
                          title: "Paxil CR",
                          left: "Sisa 2 pills",
                          refill: "Isi ulang selanjutnya: Mon, May 28",
                        ),
                        reminderRefillCard(
                          title: "Paxil CR",
                          left: "Sisa 2 pills",
                          refill: "Isi ulang selanjutnya: Mon, May 28",
                        ),
                        reminderRefillCard(
                          title: "Paxil CR",
                          left: "Sisa 2 pills",
                          refill: "Isi ulang selanjutnya: Mon, May 28",
                        ),
                        reminderRefillCard(
                          title: "Paxil CR",
                          left: "Sisa 2 pills",
                          refill: "Isi ulang selanjutnya: Mon, May 28",
                        ),
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
