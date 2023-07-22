import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:record_route/core/utils/enviroments.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/database/setting.dart';
import 'package:record_route/routes/app_pages.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onReady() async {
    print('🚩 onReady - SplashController');
    super.onReady();
    initSetting();
  }

  initSetting() async{
    // RowSettingDB db = RowSettingDB();
    // await db.open();
    // int count = await db.count();
    // if (count == 0){
    //   await db.insert(RowSetting(stepIndex: 0, darkMode: 0, onRecord: 0));
    // }
    check();
  }

  void check() async {
    String? token = await Auth.instance.getToken();
    print('token $token');

    if (token != null) {
      print('Redirect login');

      final dio = Get.find<Dio>();
      dio.options = BaseOptions(
        baseUrl: enviroment['backendUrl'] + '/api/app',
        headers: {'Authorization': 'Bearer $token'},
      );
      Get.offNamedUntil(Routes.home, (route) => true);
      print('ready to home');
    } else {
      print('Redirect login');
      Get.offNamedUntil(Routes.login, (route) => true);
    }
  }
}
