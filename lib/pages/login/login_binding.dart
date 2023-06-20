import 'package:get/get.dart';
import 'package:record_route/pages/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    print('😒 Dependency login');
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
