import 'package:get/get.dart';
import 'package:record_route/pages/router/router_controller.dart';

class RouterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RouterController>(() => RouterController());
  }
}
