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

  Seeting setting = Seeting.fromJson({});
  UserProfile userProfile = UserProfile.fromJson({});

  List<Basic> startLocations = [];
  List<Basic> location = [];

  RouterController() {
    initData();
  }

  initData() async{
    setting = await Auth.instance.getSeeting();
    userProfile = await Auth.instance.getUser();

    routes = userProfile.routes;

    update();
  }

  editRouter() {
    Get.toNamed(Routes.routerDetail);
  }

  String getCompany() {
    Company? a = userProfile.companies.firstWhereOrNull(
        (element) => element.id == userProfile.user?.companyId);
    if (a == null) {
      return "";
    }
    return a.name;
  }

  updateSetting() async{
    setting = await Auth.instance.getSeeting();
    userProfile = await Auth.instance.getUser();
    routes = userProfile.routes;
    update();
  }

  @override
  void onClose() {
    print('close controller');
    super.onClose();
  }
}
