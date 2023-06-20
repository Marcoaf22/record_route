import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:record_route/core/theme/app_theme.dart';

Future<bool> showAcceptDialog(
    {title, contentText, backgroundAccept, EdgeInsets? contentPadding}) async {
  final result = await Get.defaultDialog(
    titleStyle: const TextStyle(fontWeight: FontWeight.bold),
    titlePadding: const EdgeInsets.symmetric(vertical: 15),
    title: title,
    onWillPop: () async {
      Get.back(result: {'accept': false});
      return false;
    },
    contentPadding: contentPadding ??
        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    content: Column(
      children: [
        Text(
          contentText,
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: 'Roboco'),
        ),
      ],
    ),
    confirm: TextButton(
      onPressed: () {
        Get.back(result: {'accept': true});
      },
      style: TextButton.styleFrom(backgroundColor: backgroundAccept),
      child: const Text('Aceptar', style: TextStyle(color: Colors.white)),
    ),
    cancel: TextButton(
      onPressed: () {
        Get.back(result: {'accept': false});
      },
      style: TextButton.styleFrom(backgroundColor: Colors.grey),
      child: const Text(
        'Cancelar',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
  return result['accept'];
}

void showMessage(
    {required String title, required String content, Color? color}) {
  Get.defaultDialog(
    title: title,
    content: Text(
      content,
      textAlign: TextAlign.center,
    ),
    confirm: TextButton(
      onPressed: () {
        Get.back();
      },
      style: TextButton.styleFrom(
          backgroundColor: color ?? appThemeDataLight.colorScheme.primary),
      child: const Text('Aceptar', style: TextStyle(color: Colors.white)),
    ),
    onWillPop: () async {
      return true;
    },
  );
}

void showalert(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 240,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
          child: const SizedBox.expand(child: FlutterLogo()),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
