import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class IconContainer extends StatelessWidget {
  final double size;

  const IconContainer({Key? key, required this.size})
      : assert(size > 17),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size * 2.5,
        height: size * 2.5,
        padding: EdgeInsets.all(size * 0.15),
        child: SimpleShadow(
          opacity: 0.5,
          color: Colors.black12,
          offset: const Offset(4, 4),
          sigma: 4,
          child: Image.asset('assets/logo.jpg'),
        ));
  }
}
