import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:record_route/core/common/services.dart';
import 'package:record_route/core/utils/enviroments.dart';
import 'package:record_route/data/provider/authentication.dart';
import 'package:record_route/data/provider/request_service.dart';
import 'package:record_route/data/service/get_location.dart';

import 'database.dart';

class MainBinding implements Bindings {
  late LocationSettings locationSettings;

  @override
  void dependencies() {
    print('🎄 ManiBinding - inint');

    Get.put<Dio>(Dio(
      BaseOptions(baseUrl: enviroment['backendUrl']),
    ));

    Get.put<Service>(Service());
    Get.put<RequestService>(RequestService());
    Get.put<Authentication>(Authentication());
    Get.put<GetLocation>(GetLocation());

    final db = DataBaseInventory();
    db.createTable();
  }

  initConfig() {
    locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 100,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 10),
        //(Optional) Set foreground notification config to keep the app alive
        //when going to the background
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationText:
              "Example app will continue to receive your location even when you aren't using it",
          notificationTitle: "Running in Background",
          enableWakeLock: true,
        ));
  }
}
