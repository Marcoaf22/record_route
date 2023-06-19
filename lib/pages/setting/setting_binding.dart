import 'package:get/get.dart';
import 'package:record_route/pages/setting/setting_controller.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SeetingController>(() => SeetingController(
    //    SeetingRepository(MyApi())));
    Get.lazyPut(() => SettingController());
  }
}
