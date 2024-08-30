import 'package:flutter/material.dart';

import 'package:mahati_mobile/app/constants/shared_prefs_strings.dart';
import 'package:mahati_mobile/app/classes/bluetooth_device.dart';
import 'package:mahati_mobile/app/modules/watch/watch_controller.dart';
import 'package:mahati_mobile/app/utils/shared_prefs_utils.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget getListItem(
    BluetoothDevice device, BuildContext context, WatchController model) {
  final name = device.device.name;
  String status = device.status;
  return ListTile(
    title: Text(
      name,
      style: TextStyle(
        fontFamily: Resources.font.primaryFont,
      ),
    ),
    subtitle: Text(
      status,
      style: TextStyle(
        fontFamily: Resources.font.primaryFont,
      ),
    ),
    onTap: () async {
      model.stopScanning();
      model.connectAndUpdate(device.device.id);
      await SharedPrefsUtils.setString(
          SharedPrefsStrings.DEVICE_ID_KEY, device.device.id);
      await SharedPrefsUtils.setString(
          SharedPrefsStrings.DEVICE_NAME_KEY, device.device.name);
      await model.getWatchData();
    },
  );
}
