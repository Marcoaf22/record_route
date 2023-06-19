import 'package:dio/dio.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'package:record_route/core/utils/enviroments.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/routes/app_pages.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onReady() async {
    super.onReady();
    FlutterNativeSplash.remove();
    print('🚩 onReady - SplashController');
    check();
  }

  void check() async {
    print('🎀 Splash - Check');
    await Auth.instance.logOut();
    String? token = await Auth.instance.getToken();
    if (token != null) {
      final dio = Get.find<Dio>();
      dio.options = BaseOptions(
        baseUrl: enviroment['backendUrl'],
        headers: {'Authorization': 'Bearer $token'},
      );
      Get.offNamedUntil(Routes.home, (route) => false);
    } else {
      Get.offNamedUntil(Routes.login, (route) => false);
    }
  }
}
