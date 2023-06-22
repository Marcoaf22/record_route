import 'package:get/get.dart';

import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/data/model/basic.dart';
import 'package:record_route/data/model/router.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/routes/app_pages.dart';

class RouterController extends GetxController {
  List<Router> routes = [];
  bool onRecord = false;
  Seeting setting = Auth.instance.getSeeting();

  EntityRouter entity = EntityRouter();
  UserProfile userProfile = Auth.instance.getUser();
  User? user = Auth.instance.getUser().user;

  List<Basic> startLocations = [];
  List<Basic> location = [];

  RouterController() {
    routes.add(Router(
        date: DateTime.now().toString(),
        destiny: "Av alemana",
        name: "Ruta #",
        endHour: "19:00",
        startHour: "12:00",
        duration: "08:40",
        origin: "3 Anillo av aurelio"));
    routes.add(Router(
        date: DateTime.now().toString(),
        destiny: "Av alemana",
        name: "Ruta #",
        endHour: "19:00",
        startHour: "12:00",
        duration: "08:40",
        origin: "3 Anillo av aurelio"));
    routes.add(Router(
        date: DateTime.now().toString(),
        destiny: "Av alemana",
        name: "Ruta #",
        endHour: "19:00",
        startHour: "12:00",
        duration: "08:40",
        origin: "3 Anillo av aurelio"));
    routes.add(Router(
        date: DateTime.now().toString(),
        destiny: "Av alemana",
        name: "Ruta #",
        endHour: "19:00",
        startHour: "12:00",
        duration: "08:40",
        origin: "3 Anillo av aurelio"));
    routes.add(Router(
        date: DateTime.now().toString(),
        destiny: "Av alemana",
        name: "Ruta #",
        endHour: "19:00",
        startHour: "12:00",
        duration: "08:40",
        origin: "3 Anillo av aurelio"));
    routes.add(Router(
        date: DateTime.now().toString(),
        destiny: "Av alemana",
        name: "Ruta #",
        endHour: "19:00",
        startHour: "12:00",
        duration: "08:40",
        origin: "3 Anillo av aurelio"));
    routes.add(Router(
        date: DateTime.now().toString(),
        destiny: "Av alemana",
        name: "Ruta #",
        endHour: "19:00",
        startHour: "12:00",
        duration: "08:40",
        origin: "3 Anillo av aurelio"));
    routes.add(Router(
        date: DateTime.now().toString(),
        destiny: "Av alemana",
        name: "Ruta #",
        endHour: "19:00",
        startHour: "12:00",
        duration: "08:40",
        origin: "3 Anillo av aurelio"));
    routes.add(Router(
        date: DateTime.now().toString(),
        destiny: "Av alemana",
        name: "Ruta #",
        endHour: "19:00",
        startHour: "12:00",
        duration: "08:40",
        origin: "3 Anillo av aurelio"));
    routes.add(Router(
        date: DateTime.now().toString(),
        destiny: "Av alemana",
        name: "Ruta #",
        endHour: "19:00",
        startHour: "12:00",
        duration: "08:40",
        origin: "3 Anillo av aurelio"));
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
