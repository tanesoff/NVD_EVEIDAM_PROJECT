import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final FontWeight font_wieght;

  TextWidget({super.key,
    this.size = 30,
    required this.text,
    this.color = Colors.black,
    this.font_wieght = FontWeight.normal
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: font_wieght
      ),
    );
  }
}
