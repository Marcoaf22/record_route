import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ToastrService {
  error(message) {
    Get.snackbar('', message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          FontAwesomeIcons.xmark,
          color: Colors.white,
        ),
        // showProgressIndicator: true,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        shouldIconPulse: true,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        titleText: const SizedBox.shrink());
  }

  info(title, message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blueAccent,
      colorText: Colors.white,
      icon: const Icon(
        FontAwesomeIcons.circleExclamation,
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      shouldIconPulse: true,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
    );
  }

  success({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(
        FontAwesomeIcons.circleCheck,
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      shouldIconPulse: true,
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.TOP,
    );
  }

  messages(title, message) {
    Get.snackbar('title', message,
        backgroundColor: Colors.white, colorText: Colors.white);
  }
}
