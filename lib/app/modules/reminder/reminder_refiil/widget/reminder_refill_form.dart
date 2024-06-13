import 'package:flutter/material.dart';
import 'package:mahati_mobile/app/modules/reminder/reminder_refiil/reminder_refill_controller.dart';
import 'package:mahati_mobile/app/utils/resources.dart';
import 'package:sizer/sizer.dart';

Widget reminderRefillForm(BuildContext context) {
  final ReminderRefillController controller = ReminderRefillController();

  return Card(
    elevation: 0,
    color: Resources.color.whiteColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        buildTextField(
          label: "Nama Obat",
          hintText: "Masukkan nama obat",
          controller: controller.namaObatController,
        ),
        const SizedBox(height: 15),
        buildTextField(
          label: "Obat yang Sudah Diminum",
          hintText: "Masukkan obat yang sudah diminum",
          controller: controller.takenObatController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 15),
        buildTextField(
          label: "Total Obat",
          hintText: "Masukkan total obat",
          controller: controller.amountObatController,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 15),
        buildTextField(
          label: "Penyebab Sakit",
          hintText: "Masukkan penyebab sakit",
          controller: controller.causeObatController,
        ),
        const SizedBox(height: 15),
        buildDropdown(
          label: "Ukuran Kapsul",
          items: ['Tidak Kuat', 'Sedang', 'Kuat'],
          selectedValue: controller.selectedCapsuleSize,
          onChanged: (newValue) {
            controller.selectedCapsuleSize = newValue!;
            controller.capSizeObatController.text = newValue;
          },
        ),
        const SizedBox(height: 15),
        buildTimePickerField(
          context,
          label: "Waktu Pengingat Obat",
          controller: controller.timeObatController,
          onTap: () => controller.selectTime(context),
        ),
        const SizedBox(height: 20),
        buildSaveButton(controller),
      ],
    ),
  );
}

Widget buildTextField({
  required String label,
  required String hintText,
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Resources.color.subtitleColor,
          fontSize: 11.sp,
          fontFamily: Resources.font.primaryFont,
          fontWeight: FontWeight.w500,
        ),
      ),
      TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Resources.color.textFieldColor,
          hintText: hintText,
          hintStyle: TextStyle(color: Resources.color.hintColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Resources.color.textFieldColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Resources.color.textFieldColor),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ],
  );
}

Widget buildDropdown({
  required String label,
  required List<String> items,
  required String? selectedValue,
  required void Function(String?) onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Resources.color.subtitleColor,
          fontSize: 11.sp,
          fontFamily: Resources.font.primaryFont,
          fontWeight: FontWeight.w500,
        ),
      ),
      DropdownButtonFormField<String>(
        value: selectedValue,
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Resources.color.textFieldColor,
          hintText: "Pilih ukuran kapsul",
          hintStyle: TextStyle(color: Resources.color.hintColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Resources.color.textFieldColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Resources.color.textFieldColor),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ],
  );
}

Widget buildTimePickerField(
  BuildContext context, {
  required String label,
  required TextEditingController controller,
  required void Function() onTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Resources.color.subtitleColor,
          fontSize: 11.sp,
          fontFamily: Resources.font.primaryFont,
          fontWeight: FontWeight.w500,
        ),
      ),
      GestureDetector(
        onTap: onTap,
        child: AbsorbPointer(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Resources.color.textFieldColor,
              hintText: controller.text.isEmpty
                  ? "Pilih waktu pengingat obat (per hari)"
                  : controller.text,
              hintStyle: TextStyle(color: Resources.color.hintColor),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Resources.color.textFieldColor),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Resources.color.textFieldColor),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildSaveButton(ReminderRefillController controller) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Resources.color.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      minimumSize: const Size(double.infinity, 50),
    ),
    onPressed: () {
      controller.postReminder(
        controller.namaObatController.text,
        controller.takenObatController.text,
        controller.amountObatController.text,
        controller.causeObatController.text,
        controller.capSizeObatController.text,
        controller.timeObatController.text,
      );
    },
    child: Text(
      "Simpan",
      style: TextStyle(
        color: Resources.color.whiteColor,
        fontSize: 11.sp,
        fontFamily: Resources.font.primaryFont,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
