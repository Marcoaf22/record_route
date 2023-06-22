import 'package:get/get.dart';

import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/data/model/basic.dart';

import 'package:record_route/data/model/router.dart';
import 'package:record_route/data/model/router_create.dart';
import 'package:record_route/data/model/user.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/data/service/get_location.dart';

class RouterFormController extends GetxController {
  RouterCreate entity = RouterCreate.empty();

  Seeting setting = Auth.instance.getSeeting();
  Company? plant;
  Product? product;

  List<Company> plants = Auth.instance.getUser().factories;
  List<Company> stations = Auth.instance.getUser().companies;
  List<Product> products = Auth.instance.getUser().products;

  UserProfile user = Auth.instance.getUser();
  GetLocation service = Get.find<GetLocation>();

  RouterFormController() {
    print('🎈 Controller form');
    stations = stations.map((e) {
      e.index = 0;
      e.selected = false;
      return e;
    }).toList();
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

  Future<bool> save() async {
    print('save');
    bool result = await service.checkPermission();
    if (result) {
      await 
    }
    return result;
  }

  initLocation() async {
    service.serviceStatusListen();
    service.locationListen();
  }

  prepareData() {
    entity.factoryId = plant!.id!;
    entity.companies = stations
        .where((element) => element.selected)
        .map((e) => CompanyId(id: e.id!))
        .toList();
    entity.driverId = user.driver?.id ?? 0;
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
