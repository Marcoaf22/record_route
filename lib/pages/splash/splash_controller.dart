import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:record_route/core/utils/enviroments.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/routes/app_pages.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onReady() async {
    print('🚩 onReady - SplashController');
    super.onReady();
    check();
  }

  void check() async {
    print('check flute100r');
    String? token = await Auth.instance.getToken();
    print(token);

    if (token != null) {
      final dio = Get.find<Dio>();
      dio.options = BaseOptions(
        baseUrl: enviroment['backendUrl'] + '/api/app',
        headers: {'Authorization': 'Bearer $token'},
      );
      Get.offNamedUntil(Routes.home, (route) => false);
    } else {
      Get.offNamedUntil(Routes.login, (route) => false);
    }
  }
}
