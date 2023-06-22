import 'package:get/get.dart';

import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/data/model/basic.dart';
import 'package:record_route/data/model/router.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/routes/app_pages.dart';

class RouterController extends GetxController {
  List<Route> routes = [];
  bool onRecord = false;
  Seeting setting = Auth.instance.getSeeting();

  UserProfile userProfile = Auth.instance.getUser();
  User? user = Auth.instance.getUser().user;

  List<Basic> startLocations = [];
  List<Basic> location = [];

  RouterController() {
    routes = Auth.instance.getUser().routes;
  }

  editRouter() {
    Get.toNamed(Routes.routerDetail);
  }

  String getCompany() {
    Company? a = userProfile.companies
        .firstWhereOrNull((element) => element.id == user?.companyId);
    if (a == null) {
      return "";
    }
    return a.name ?? "";
  }

  updateSetting() {
    setting = Auth.instance.getSeeting();
    update();
  }
}
