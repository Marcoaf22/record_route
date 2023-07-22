import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:record_route/core/theme/app_theme.dart';
import 'package:record_route/core/utils/main_binding.dart';
import 'package:record_route/pages/splash/splash_controller.dart';
import 'package:record_route/pages/splash/splash_page.dart';
import 'package:record_route/routes/app_pages.dart';

void main() async {
  // await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF004231),
    ));

    return GetMaterialApp(
      title: 'Record route',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,

      theme: appThemeDataLight,
      // translations: AppTranslation.translations,
      defaultTransition: Transition.fade,
      initialBinding: MainBinding(),
      smartManagement: SmartManagement.full,
      getPages: AppPages.pages,
      enableLog: true,
      onReady: () {
        print('Reody GetMaterial APP');
      },
      onDispose: (){
        print('🫡 disponse get Material app');
      },
      popGesture: true,
      home: const SplashPage(),
    );
  }
}
