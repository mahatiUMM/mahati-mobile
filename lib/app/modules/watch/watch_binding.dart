import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/watch/watch_controller.dart';

class WatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WatchController());
  }
}
