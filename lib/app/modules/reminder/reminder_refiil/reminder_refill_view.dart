import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refiil/reminder_refill_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

class ReminderRefillView extends GetView<ReminderRefillController> {
  const ReminderRefillView({Key? key}) : super(key: key);

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
                        const Text(
                          'Refill Reminder',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Vivamus nec nulla sed libero ultrices fermentum. '
                          'Vivamus nec nulla sed libero ultrices fermentum.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Resources.color.baseColor,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Pilih Obat',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Resources.color.baseColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.search,
                                color: Resources.color.baseColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Cari obat',
                                style: TextStyle(
                                  color: Resources.color.baseColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Pilih Waktu',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Resources.color.baseColor
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.calendar_today,
                                      color: Resources.color.baseColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Pilih Tanggal',
                                      style: TextStyle(
                                        color: Resources.color.baseColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
