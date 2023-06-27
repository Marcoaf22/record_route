import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:record_route/pages/login/login_controller.dart';
import 'package:record_route/pages/login/widgets/icon_container.dart';
import 'package:record_route/pages/login/widgets/login_form.dart';
import 'package:record_route/util/percent_width_height.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) => Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: SizedBox(
              width: 100.0.wp,
              height: 100.0.hp,
              // color: Colors.black,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 10.0.hp,
                    child: Column(
                      children: <Widget>[
                        IconContainer(
                          size: 35.0.wp,
                        ),
                        SizedBox(
                          height: 1.4.dp,
                        ),
                      ],
                    ),
                  ),
                  const LoginForm(),
                  // Positioned(
                  //   bottom: 50,
                  //   child: TextButton(
                  //       onPressed: () {},
                  //       child: const Text(
                  //         '¿Olvidaste tu Contraseña?',
                  //       )),
                  // ),
                  Positioned.fill(
                    child: Obx(
                      () {
                        if (_.state == LoginState.loading) {
                          return Container(
                            color: Colors.black26,
                            child: const Center(
                                child: CircularProgressIndicator()),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
