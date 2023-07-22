import 'package:get/get.dart';

import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/data/model/basic.dart';

import 'package:record_route/data/model/router.dart';
import 'package:record_route/data/model/router_create.dart';
import 'package:record_route/data/model/user.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/data/provider/request_service.dart';
import 'package:record_route/data/service/get_location.dart';

class RouterFormController extends GetxController {
  RouterCreate entity = RouterCreate.empty();

  Seeting setting = Seeting.fromJson({});
  Company? plant;
  Product? product;

  List<Company> plants = [];
  List<Company> stations = [];
  List<Product> products = [];

  UserProfile user = UserProfile.fromJson({});
  GetLocation locationService = Get.find<GetLocation>();
  RequestService service = Get.find<RequestService>();

  RouterFormController() {}

  initData() async {
    setting = await Auth.instance.getSeeting();
    user = await Auth.instance.getUser();

    plants = user.factories;
    stations = user.companies;
    products = user.products;

    stations = stations.map((e) {
      e.index = 0;
      e.selected = false;
      return e;
    }).toList();

    update();
  }

  bool validateForm() {
    List<Company> selecteds =
        stations.where((element) => element.selected).toList();
    return selecteds.isEmpty;
  }

  desmark(int index) {
    stations = stations.map((element) {
      if (element.selected && element.index > index) {
        element.index = element.index - 1;
      }
      return element;
    }).toList();
    update();
  }

  int nextIndex() {
    return stations.where((element) => element.selected).toList().length;
  }

  Future<bool> validateServiceEnable() async {
    return await locationService.checkActiveService();
  }

  Future<bool> save() async {
    bool result = await locationService.checkPermission();
    if (result) {
      prepareData();
      Map<String, dynamic>? res =
          await service.createRoute(url: '/routes', body: entity.toJson());
      if (res != null) {
        Route route = Route.fromJson(res);
        user.routes.add(route);
        user.routeActive = route;
        user.onRoute = true;
        setting.onRecord = true;
        Auth.instance.setUser(user.toJson());
        create();
        return true;
      }
    }
    return false;
  }

  initLocation() async {
    locationService.locationListen();
    locationService.initSendLocation();
  }

  prepareData() {
    entity.factoryId = plant!.id!;
    entity.companies = stations
        .where((element) => element.selected)
        .map((e) => CompanyId(id: e.id!))
        .toList();
    entity.driverId = user.driver?.id ?? 0;
    entity.dateStart = DateTime.now();
    entity.productoId = product?.productoId ?? 0;
  }

  create() {
    initLocation();
    setting.onRecord = true;
    setting.stepIndex = 1;
    setting.stations = stations.where((element) => element.selected).toList();
    setting.fuelPlant = plant;
    Auth.instance.setSeeting(setting);
    return true;
  }
}
