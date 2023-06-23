import 'package:get/get.dart';

import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/model/auth/setting.dart';
import 'package:record_route/data/model/basic.dart';
import 'package:record_route/data/model/router.dart';
import 'package:record_route/data/model/user_profile.dart';
import 'package:record_route/data/service/get_location.dart';

class RouterDetailController extends GetxController {
  List<Company> stations = [];
  Company? fuelPlant;
  Seeting setting = Auth.instance.getSeeting();

  UserProfile userProfile = Auth.instance.getUser();
  User? user = Auth.instance.getUser().user;

  RouterDetailController() {
    stations = setting.stations;
    fuelPlant = setting.fuelPlant;
    stations.sort((a, b) => a.index - b.index);
  }

  String getCompany() {
    Company? a = userProfile.companies
        .firstWhereOrNull((element) => element.id == user?.companyId);
    if (a == null) {
      return "";
    }
    return a.name ?? "";
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
