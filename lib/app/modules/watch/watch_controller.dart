import 'package:get/get.dart';

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:mahati_mobile/app/constants/shared_prefs_strings.dart';
import 'package:mahati_mobile/app/utils/shared_prefs_utils.dart';
import 'package:mahati_mobile/app/utils/watch_utils.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:mahati_mobile/app/classes/bluetooth_device.dart';

class WatchController extends GetxController {
  final RxString currentDeviceIds = ''.obs;
  final RxString currentDeviceName = ''.obs;
  final RxInt currentDeviceBattery = 0.obs;

  final List<String> _deviceIds = [];
  final RxList<BluetoothDevice> _devices = <BluetoothDevice>[].obs;

  final _flutterReactiveBle = FlutterReactiveBle();
  StreamSubscription? _subscription;

  UnmodifiableListView<BluetoothDevice> get devices =>
      UnmodifiableListView(_devices);

  @override
  void onInit() {
    super.onInit();
    getWatchData();
  }

  void removeDevice() async {
    await SharedPrefsUtils.remove(SharedPrefsStrings.DEVICE_ID_KEY);
    await SharedPrefsUtils.remove(SharedPrefsStrings.DEVICE_NAME_KEY);
    currentDeviceIds.value = '';
    currentDeviceName.value = '';
    currentDeviceBattery.value = 0;
  }

  Future<void> getWatchData() async {
    final key =
        await SharedPrefsUtils.getString(SharedPrefsStrings.DEVICE_ID_KEY) ??
            '';
    final name =
        await SharedPrefsUtils.getString(SharedPrefsStrings.DEVICE_NAME_KEY) ??
            '';
    if (key.isNotEmpty && name.isNotEmpty) {
      currentDeviceIds.value = key;
      currentDeviceName.value = name;
      await getWatchService();
    }
  }

  Future<void> getWatchService() async {
    try {
      var services = await discoverServices(currentDeviceIds.value);
      debugPrint('services: ${services.length}');
      for (var service in services) {
        var serviceUuid = service.serviceId;
        var serviceIdStr = serviceUuid.toString().trim().toLowerCase();
        var characteristicIds = service.characteristicIds;
        if (serviceIdStr.contains('183e')) {
          // physical activity monitor service
          debugPrint('found physical activity monitor service');
          for (var characteristicId in characteristicIds) {
            String characteristicIdStr = characteristicId.toString().trim();
            if (characteristicIdStr.contains('00002b40')) {
              // steps
              final characteristic = QualifiedCharacteristic(
                serviceId: serviceUuid,
                characteristicId: characteristicId,
                deviceId: currentDeviceIds.value,
              );
            } else if (characteristicIdStr.contains('00002b41')) {
              // sleep instantaneous data
              final characteristic = QualifiedCharacteristic(
                serviceId: serviceUuid,
                characteristicId: characteristicId,
                deviceId: currentDeviceIds.value,
              );
            } else if (characteristicIdStr.contains('00002b42')) {
              // sleep summary data
              final characteristic = QualifiedCharacteristic(
                serviceId: serviceUuid,
                characteristicId: characteristicId,
                deviceId: currentDeviceIds.value,
              );
            }
          }
        } else if (serviceIdStr.contains('180d')) {
          // heart rate service
          debugPrint('found heart rate service');
          for (var characteristicId in characteristicIds) {
            String characteristicIdStr = characteristicId.toString().trim();
            if (characteristicIdStr.contains('00002a37')) {
              // heart rate measurement
              final characteristic = QualifiedCharacteristic(
                serviceId: serviceUuid,
                characteristicId: characteristicId,
                deviceId: currentDeviceIds.value,
              );
            }
          }
        } else if (serviceIdStr.contains('180f')) {
          // battery service
          debugPrint('found battery service');
          for (var characteristicId in characteristicIds) {
            String characteristicIdStr = characteristicId.toString().trim();
            if (characteristicIdStr.contains('00002a19')) {
              // battery level
              final characteristic = QualifiedCharacteristic(
                serviceId: serviceUuid,
                characteristicId: characteristicId,
                deviceId: currentDeviceIds.value,
              );
              try {
                List<int> values = await getCharacteristicData(characteristic);
                currentDeviceBattery.value = WatchUtils.getBatteryLevel(values);
              } catch (err) {
                debugPrint('battery level error');
                debugPrint(err.toString());
              }
            }
          }
        } else if (serviceIdStr.contains('fee0')) {
          // mi band
          debugPrint('found mi band fee0 service');
          for (var characteristicId in characteristicIds) {
            String characteristicIdStr = characteristicId.toString().trim();
            if (characteristicIdStr.contains('00000007')) {
              // steps
              final characteristic = QualifiedCharacteristic(
                serviceId: serviceUuid,
                characteristicId: characteristicId,
                deviceId: currentDeviceIds.value,
              );
              try {
                int goalSteps = await SharedPrefsUtils.getInt(
                        SharedPrefsStrings.GOAL_STEPS_KEY) ??
                    5000;

                var miReadData = await getCharacteristicData(characteristic);
              } catch (err) {
                debugPrint('steps error');
                debugPrint(err.toString());
              }
            } else if (characteristicIdStr.contains('00000006')) {
              // battery
              final characteristic = QualifiedCharacteristic(
                serviceId: serviceUuid,
                characteristicId: characteristicId,
                deviceId: currentDeviceIds.value,
              );
            }
          }
        } else if (serviceIdStr.contains('fee1')) {
          // mi band
          debugPrint('found mi band fee1 service');
        } else {
          debugPrint('other service: $serviceIdStr');
        }
      }
    } catch (err) {
      debugPrint('getWatchService error');
      debugPrint(err.toString());
    }
  }

  void startScanning() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
    ].request();
    print(statuses);

    _deviceIds.clear();
    _devices.clear();
    _subscription = _flutterReactiveBle.scanForDevices(
        withServices: [], scanMode: ScanMode.lowLatency).listen((device) {
      //code for handling results
      debugPrint('device: ${device.name} ${device.id}');
      if (device.name.trim() != '' && !_deviceIds.contains(device.id)) {
        debugPrint(
            'deviceIds contains ${device.id}: ${_deviceIds.contains(device.id)}');
        debugPrint('new device: ${device.name}');
        _deviceIds.add(device.id);
        _devices.add(BluetoothDevice(device, 'unknown'));
      }
    }, onError: (err) {
      //code for handling error
      debugPrint('error: ${err.toString()}');
    });
  }

  Future<void> stopScanning() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  Stream<ConnectionStateUpdate> connect(String deviceId) {
    return _flutterReactiveBle.connectToDevice(
      id: deviceId,
      connectionTimeout: const Duration(seconds: 10),
    );
  }

  void connectAndUpdate(String deviceId) {
    _flutterReactiveBle
        .connectToDevice(
      id: deviceId,
      connectionTimeout: const Duration(seconds: 10),
    )
        .listen((event) {
      DeviceConnectionState status = event.connectionState;
      int index = _deviceIds.indexOf(deviceId);
      switch (status) {
        case DeviceConnectionState.connected:
          _devices[index].status = 'Connected';
          break;
        case DeviceConnectionState.connecting:
          _devices[index].status = 'Connecting';
          break;
        case DeviceConnectionState.disconnected:
          _devices[index].status = 'Disconnected';
          break;
        case DeviceConnectionState.disconnecting:
          _devices[index].status = 'Disconnecting';
          break;
        default:
          _devices[index].status = 'Unknown';
      }
    });
  }

  Future<List<DiscoveredService>> discoverServices(String deviceId) {
    return _flutterReactiveBle.discoverServices(deviceId);
  }

  Future<List<int>> getCharacteristicData(QualifiedCharacteristic c) {
    return _flutterReactiveBle.readCharacteristic(c);
  }

  Stream<List<int>> subscribeToCharacteristic(QualifiedCharacteristic c) {
    return _flutterReactiveBle.subscribeToCharacteristic(c);
  }
}
