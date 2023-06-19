import 'package:flutter/material.dart';

class OptionSeeting extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool value;
  final Color colorIcon;
  final void Function(bool event) onChanged;

  const OptionSeeting(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onChanged,
      required this.value,
      required this.colorIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: colorIcon,
              size: 25,
            ),
          ),
          Text(title),
          const Spacer(),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
