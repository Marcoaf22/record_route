import 'package:get/get.dart';

import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/data/model/basic.dart';
import 'package:record_route/data/model/router.dart';
import 'package:record_route/data/model/user.dart';
import 'package:record_route/data/service/get_location.dart';

class RouterDetailController extends GetxController {
  List<BasicSelected> stations = [];
  Basic? fuelPlant;
  Seeting setting = Auth.instance.getSeeting();

  EntityRouter entity = EntityRouter();
  User user = Auth.instance.getUser();

  RouterDetailController() {
    print('🎁 Router detail');
    stations = setting.stations;
    fuelPlant = setting.fuelPlant;
    print("planta:  ${fuelPlant?.name}");
    stations.sort((a, b) => a.index - b.index);
  }

  nextStep(int nextStep) {
    setting.stepIndex = nextStep;
    Auth.instance.setSeeting(setting);
    update();
  }

  closed() {
    setting.stepIndex = 0;
    setting.onRecord = false;
    Auth.instance.setSeeting(setting);
    locationCancel();
    Get.back();
  }

  locationCancel() {
    GetLocation service = Get.find<GetLocation>();
    service.locationCancel();
  }
}
