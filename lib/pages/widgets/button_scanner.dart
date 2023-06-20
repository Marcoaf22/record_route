import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonScanner extends StatelessWidget {
  final void Function() onPressed;
  final Color background;
  final Color? color;
  final String label;
  final double fontSize;
  final EdgeInsets? padding;

  const ButtonScanner(
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
      ),
      onPressed: onPressed,
      icon: Icon(
        CupertinoIcons.qrcode_viewfinder,
        color: color,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
