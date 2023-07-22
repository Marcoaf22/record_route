import 'package:get/get.dart';
import 'package:record_route/data/provider/authentication.dart';

enum LoginState { loading, initial }

class LoginController extends GetxController {
  Rx<LoginState> state = LoginState.initial.obs;

  LoginController(){
    print('Constr lognControllen');
  }

  @override
  void onInit() {
    print('🎶 init login controller');
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
