import 'package:get/get.dart';
import 'package:mahati_mobile/app/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.lazyPut(() => HomeController());
  }
}
