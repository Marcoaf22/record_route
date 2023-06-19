import 'package:flutter/material.dart';

class TextColor extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? background;
  final EdgeInsets? padding;
  final double? radius;
  final bool bold;
  final double fontSize;
  final EdgeInsets? margin;
  final double? width;

  const TextColor(
      {Key? key,
      required this.title,
      this.color,
      this.background,
      this.padding,
      this.radius,
      this.bold = true,
      this.fontSize = 12,
      this.margin,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      padding: padding ?? const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: background ?? const Color(0xff3498db),
          borderRadius: BorderRadius.circular(radius ?? 0)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: color ?? Colors.white,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize),
        ),
      ),
    );
  }
}
