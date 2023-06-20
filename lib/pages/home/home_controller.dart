import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/user.dart';
import 'package:record_route/pages/home/widget/home_widget.dart';
import 'package:record_route/data/model/auth/setting.dart';

import 'package:record_route/pages/router/router_page.dart';
import 'package:record_route/routes/app_pages.dart';

enum RequestState { loading, initial }

class HomeController extends GetxController {
  Rx<RequestState> staterequest = RequestState.initial.obs;

  List<Widget> listPage = [
    HomeWidget(),
    RouterPage(),
  ];

  int indexSelected = 0;

  User? user;
  Seeting setting = Auth.instance.getSeeting();

  HomeController();

  set patientcode(int patientcode) {}

  @override
  void onInit() async {
    print('❤ onInit - HomeController');
    super.onInit();
    // FlutterNativeSplash.remove();
  }

  @override
  void onReady() async {
    super.onReady();
    user = await Auth.instance.getUser();
    print('❤ onReady - HomeController');
    update(['homeWidget']);
  }

  void updateIndexSelected(index) {
    indexSelected = index;
    setting = Auth.instance.getSeeting();
    update();
  }

  void updateSetting() {
    setting = Auth.instance.getSeeting();
    // Future.delayed(Duration(seconds: 1), () {
    update(['homeWidget']);
    // });
  }

  void logOut() {
    Auth auth = Auth.instance;
    auth.logOut();
    Get.offAllNamed(Routes.login);
  }
}
