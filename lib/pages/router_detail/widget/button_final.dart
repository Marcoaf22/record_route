import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:record_route/util/percent_width_height.dart';

class ButtonFinal extends StatelessWidget {
  final void Function() onPressed;
  final Color background;
  final Color? color;
  final String label;
  final double fontSize;
  final int index;
  final int indexSelected;
  final IconData icon;
  final EdgeInsets? padding;

  const ButtonFinal(
      {super.key,
      required this.onPressed,
      required this.background,
      this.color,
      required this.label,
      required this.fontSize,
      required this.index,
      required this.indexSelected,
      this.padding,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: index == indexSelected ? onPressed : () {},
          child: Container(
            height: 7.0.hp,
            width: 90.0.wp,
            decoration: BoxDecoration(
              color: index > indexSelected
                  ? Colors.grey
                  : index == indexSelected
                      ? background
                      : Colors.blue,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Text(
                      label,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
