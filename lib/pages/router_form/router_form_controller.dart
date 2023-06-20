import 'package:get/get.dart';

import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/data/model/basic.dart';

import 'package:record_route/data/model/router.dart';
import 'package:record_route/data/model/user.dart';
import 'package:record_route/data/service/get_location.dart';

class RouterFormController extends GetxController {
  Seeting setting = Auth.instance.getSeeting();

  Basic? plant;

  List<Basic> plants = fuelPlants;
  List<BasicSelected> stations = gasStations;

  EntityRouter entity = EntityRouter();
  User user = Auth.instance.getUser();

  RouterFormController() {
    print('🎈 Controller form');
    stations = stations.map((e) {
      e.index = 0;
      e.selected = false;
      return e;
    }).toList();
  }

  bool validateForm() {
    List<BasicSelected> selecteds =
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
    await create();
    return true;
  }

  initLocation() async {
    GetLocation service = Get.find<GetLocation>();
    // var a = await service.determinePosition();
    // service.updateLoction();
    service.serviceStatusListen();
    service.locationListen();
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
