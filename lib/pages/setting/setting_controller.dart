import 'package:get/get.dart';
import 'package:record_route/core/theme/app_theme.dart';
import 'package:record_route/data/model/auth/auth.dart';

import '../../data/model/auth/setting.dart';

class SettingController extends GetxController {
  String title = "Setting";
  late bool onCamera;
  late bool darkMode;

  SettingController() {
    Seeting seeting = Auth.instance.getSeeting();
    darkMode = seeting.darkMode;
  }

  void configOnCamera(bool event) async {
    onCamera = event;
    Seeting st = Auth.instance.getSeeting();
    await Auth.instance.setSeeting(st);
    update();
  }

  Future<void> configDarkMode(bool event) async {
    darkMode = event;
    Seeting st = Auth.instance.getSeeting();
    st.darkMode = event;
    if (darkMode) {
      print('is darkmode');
      // print(appThemeDataDark.colorScheme.primary);
      Get.changeTheme(appThemeDataDark);
    } else {
      print('is not darkmode');

      Get.changeTheme(appThemeDataLight);
    }
    await Auth.instance.setSeeting(st);
    update();
  }
}
