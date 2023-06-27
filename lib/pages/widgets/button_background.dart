import 'package:flutter/material.dart';
import 'package:record_route/util/percent_width_height.dart';

class ButtonBackground extends StatelessWidget {
  final void Function() onPressed;
  final Color? background;
  final Color? color;
  final String label;
  final double? fontSize;
  final EdgeInsets? padding;

  const ButtonBackground(
      {Key? key,
      required this.onPressed,
      this.color,
      required this.label,
      required this.background,
      required this.fontSize,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: background,
        padding: padding,
        shadowColor: Colors.red,
      ),
      onPressed: onPressed,
      icon: Icon(
        Icons.logout,
        color: color,
        size: 1.9.dp,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: color,
          letterSpacing: 1,
          fontSize: fontSize ?? 1.9.dp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
