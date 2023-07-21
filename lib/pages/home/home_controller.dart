import 'package:flutter/material.dart' as W;
import 'package:get/get.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/data/service/get_location.dart';
import 'package:record_route/pages/home/widget/home_widget.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/pages/router/router_page.dart';
import 'package:record_route/routes/app_pages.dart';

import 'dart:isolate';
import 'dart:ui';
import 'package:background_locator_2/background_locator.dart';
import 'package:background_locator_2/location_dto.dart';
import 'package:background_locator_2/settings/android_settings.dart';
import 'package:background_locator_2/settings/locator_settings.dart';

enum RequestState { loading, initial }

class HomeController extends GetxController {
  Rx<RequestState> staterequest = RequestState.initial.obs;
  bool requestLocation = false;

  List<W.Widget> listPage = [
    HomeWidget(),
    const RouterPage(),
  ];

  int indexSelected = 0;
  UserProfile userProfile = Auth.instance.getUser();
  Seeting setting = Auth.instance.getSeeting();
  Route? router;
  GetLocation service = Get.find<GetLocation>();

  static const String _isolateName = "LocatorIsolate";
  ReceivePort port = ReceivePort();

  HomeController();

  @override
  void onInit() async {
    // initBackground();
    super.onInit();
    checkOnRoute();
  }

  initBackground() {
    print('💕😘😁 init backgroupnd');
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
    port.listen((dynamic data) {
      print('😘 data isolate');
      print(data);
    });
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    print('init back locator');
    await BackgroundLocator.initialize();
  }

  @pragma('vm:entry-point')
  static void callback(LocationDto locationDto) async {
    print('💕 callback');
    print(locationDto);
    final SendPort? send = IsolateNameServer.lookupPortByName(_isolateName);
    send?.send(locationDto);
  }

//Optional
  @pragma('vm:entry-point')
  static void initCallback(Map _) {
    print('Plugin initialization');
  }

//Optional
  @pragma('vm:entry-point')
  static void notificationCallback() {
    print('User clicked on the notification');
  }

  void startLocationService() {
    print('❤️ startLocationService');
    BackgroundLocator.registerLocationUpdate(
      callback,
      initCallback: initCallback,
      initDataCallback: {},
      disposeCallback: null,
      autoStop: false,
      androidSettings: AndroidSettings(
        accuracy: LocationAccuracy.NAVIGATION,
        interval: 5,
        distanceFilter: 0,
        androidNotificationSettings: AndroidNotificationSettings(
          notificationChannelName: 'Location tracking',
          notificationTitle: 'Start Location Tracking',
          notificationMsg: 'Track location in background',
          notificationBigMsg:
              'Background location is on to keep the app up-tp-date with your location. This is required for main features to work properly when the app is not running.',
          notificationIcon: '',
          notificationTapCallback: notificationCallback,
        ),
      ),
    );
  }

  checkOnRoute() {
    if (userProfile.routeActive != null) {
      int stepIndex = userProfile.routeActive!.locations
          .indexWhere((element) => element.status == 0);
      setting.stepIndex = stepIndex == -1 ? 1 : stepIndex + 1;

      router = userProfile.routeActive;
      userProfile.onRoute = true;
      service.routeActiveRecord();
    } else {
      userProfile.onRoute = false;
      if (userProfile.routes.isNotEmpty) {
        router = userProfile.routes.last;
      }
    }
    setting.onRecord = userProfile.onRoute;

    Auth.instance.setSeeting(setting);
    Auth.instance.setUser(userProfile.toJson());
  }

  @override
  void onReady() async {
    super.onReady();
    print('🎁 on Ready - home');
    service.serviceStatusListen();
    bool result = await service.checkPermission();
    // if (result) {
    //   Future.delayed(Duration(seconds: 3), () {
    //     startLocationService();
    //   });
    // }
    service.checkActiveService();
    update(['homeWidget']);
  }

  isOnRoute() {}

  void updateIndexSelected(index) {
    indexSelected = index;
    setting = Auth.instance.getSeeting();
    update();
  }

  void updateSetting() {
    setting = Auth.instance.getSeeting();
    userProfile = Auth.instance.getUser();
    if (userProfile.routeActive != null) {
      router = userProfile.routeActive;
    } else {
      router = userProfile.routes.last;
    }
    update(['homeWidget']);
  }

  void logOut() {
    Auth auth = Auth.instance;
    auth.logOut();
    Get.offAllNamed(Routes.login);
  }
}
