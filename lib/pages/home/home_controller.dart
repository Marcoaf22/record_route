import 'package:flutter/material.dart' as W;
import 'package:get/get.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/data/service/get_location.dart';
import 'package:record_route/pages/home/widget/home_widget.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/pages/router/router_page.dart';
import 'package:record_route/routes/app_pages.dart';

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
  // User? user = Auth.instance.getUser().user;
  Seeting setting = Auth.instance.getSeeting();
  Route? router;
  GetLocation service = Get.find<GetLocation>();

  HomeController();

  @override
  void onInit() async {
    super.onInit();
    checkOnRoute();
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
    service.checkPermission();
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
