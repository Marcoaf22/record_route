import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String? label;
  final double fontSize;
  final bool isTitle;
  final EdgeInsets? padding;
  final TextAlign? textAlign;
  final Color color;

  const LabelText({
    Key? key,
    required this.label,
    this.fontSize = 15,
    this.textAlign,
    this.isTitle = false,
    this.padding,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        label ?? 'Admitido',
        textAlign: textAlign,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: isTitle ? FontWeight.w900 : FontWeight.normal,
        ),
      ),
    );
  }
}
