import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/setting/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
