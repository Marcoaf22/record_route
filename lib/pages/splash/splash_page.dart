import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:record_route/pages/splash/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) => const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.black38,
          ),
          // child: SvgPicture.asset('assets/logo.svg',
          //     width: 140, color: Colors.yellow.shade700),
        ),
      ),
    );
  }
}
