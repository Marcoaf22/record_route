import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonOption extends StatelessWidget {
  final void Function() onPressed;
  final Color background;
  final Color? color;
  final String label;
  final double fontSize;
  final int index;
  final int indexSelected;
  final EdgeInsets? padding;

  const ButtonOption(
      {super.key,
      required this.onPressed,
      required this.background,
      this.color,
      required this.label,
      required this.fontSize,
      required this.index,
      required this.indexSelected,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(
        style: TextButton.styleFrom(
          backgroundColor: index > indexSelected
              ? Colors.grey
              : index == indexSelected
                  ? background
                  : Colors.blue,
          padding: padding,
        ),
        onPressed: index != indexSelected ? null : onPressed,
        icon: Icon(
          CupertinoIcons.qrcode_viewfinder,
          color: color,
        ),
        label: Text(
          "${label}",
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
