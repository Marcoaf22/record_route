import 'package:get/get.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:record_route/data/model/auth/auth.dart';
import 'package:record_route/data/provider/authentication.dart';
import '../../data/model/auth/setting.dart';

enum LoginState { loading, initial }

class LoginController extends GetxController {
  Rx<LoginState> state = LoginState.initial.obs;

  LoginController();

  @override
  void onInit() {
   // FlutterNativeSplash.remove();
    super.onInit();
  }

  Future<bool> signIn(String email, String password) async {
    Authentication auth = Get.find<Authentication>();
    state(LoginState.loading);
    bool isOk = await auth.login(email: email, password: password);
    state(LoginState.initial);
    return isOk;
  }
}
