// import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/data/model/location.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/data/provider/request_service.dart';
import 'package:record_route/data/service/get_location.dart';
import 'package:record_route/pages/home/home_controller.dart';
import 'package:record_route/pages/router/router_controller.dart';

class RouterDetailController extends GetxController {
  late Route router;

  User? user;
  bool disabled = false;

  List<Location> companies = [];
  Company? fuelPlant;
  Seeting setting = Seeting.fromJson({});
  UserProfile userProfile = UserProfile.fromJson({});

  GetLocation service = Get.find<GetLocation>();
  RequestService request = Get.find<RequestService>();

  RouterDetailController() {
  }

  oninit

  initData() async  {
    setting = await Auth.instance.getSeeting();
    userProfile = await Auth.instance.getUser();

    user = userProfile.user;

    fuelPlant = setting.fuelPlant;
    router = userProfile.routeActive!;

    int index = 0;
    companies = router.locations.where((element) {
      index++;
      if (index > 2 && index < router.locations.length) {
        return true;
      }
      return false;
    }).toList();

    service.requestService.listen((bool status) {
      disabled = status;
      update();
    });
  }

  String getCompany() {
    Company? a = userProfile.companies
        .firstWhereOrNull((element) => element.id == user?.companyId);
    if (a == null) {
      return "";
    }
    return a.name;
  }

  Future<bool> nextStep(int nextStep) async {
    Location location = router.locations[nextStep - 2];

    bool result = await savePosition(location.id);
    if (result) {
      setting.stepIndex = nextStep;
      Auth.instance.setSeeting(setting);
      update();
      return true;
    }
    return false;
  }

  Future<bool> savePosition(int locationId) async {
    try {
      // Position position = await service.determinePosition();

      // RowLocation row = RowLocation(
      //   dateTime: DateTime.now(),
      //   latitude: position.latitude.toString(),
      //   driverId: userProfile.driver?.id ?? 0,
      //   longitude: position.longitude.toString(),
      //   routeId: router.id,
      //   id: locationId,
      // );

      // RowLocationDB db = RowLocationDB();
      // await db.open();
      // List<Map> list = [row.toJson()];
      // bool result = await request.post(url: '/routes/locations', body: list);
      // await db.insert(row);

      // return result;

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Map>> prepareData() async {
    RowLocationDB db = RowLocationDB();
    await db.open();
    List<RowLocation> result = await db.getAll();

    return result.map((e) {
      return e.toJson();
    }).toList();
  }

  Future<bool> closed() async {
    bool result =
        await savePosition(router.locations[router.locations.length - 1].id);
    if (!result) return false;

    List<Map> list = await service.getLocations();
    result = await request.put(url: '/routes/finish/${router.id}', body: list);
    if (result) {
      await updateRoute(router.id);
      service.routeCancelRecord();
      Get.back();
      return true;
    }
    return false;
  }

  Future<void> updateRoute(int id) async {
    Route? route = await request.getRoute(id: id);
    if (route != null) {
      setting.stepIndex = -1;
      setting.onRecord = false;

      userProfile.routeActive = null;
      userProfile.onRoute = false;
      userProfile.routes.last = route;

      Auth.instance.setSeeting(setting);
      Auth.instance.setUser(userProfile.toJson());

      HomeController home = Get.find<HomeController>();
      home.updateSetting();
      bool routerActive = Get.isRegistered<RouterController>();
      if (routerActive) {
        RouterController router = Get.find<RouterController>();
        router.updateSetting();
      }
    }
  }

  locationCancel() {}
}
