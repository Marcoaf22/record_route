import 'package:get/get.dart';
import 'dart:math' as math;

extension PercentSized on double {
  static final double _diagonal =
      math.sqrt(math.pow(Get.width, 2) + math.pow(Get.height, 2));

  double get hp => (Get.height * (this / 100));
  double get wp => (Get.width * (this / 100));
  double get dp => (_diagonal * (this / 100));
}

extension ResponsiveText on double {
  double get sp => Get.width / 100 * (this / 3);
}
