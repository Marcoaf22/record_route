import 'package:get/get.dart';

import 'package:record_route/pages/router_detail/router_detail_controller.dart';

class RouterDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RouterDetailController>(() => RouterDetailController());
  }
}
