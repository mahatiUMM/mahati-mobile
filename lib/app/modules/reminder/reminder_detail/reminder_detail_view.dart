import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_detail/reminder_detail_controller.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_detail/widget/custom_sliver_delegate.dart';

class ReminderDetailView extends GetView<ReminderDetailController> {
  const ReminderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSliverDelegate(expandedHeight: 120),
            ),
            const SliverFillRemaining(
              child: Center(
                child: Text("data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
