import 'package:eve_idam/Widgets/Text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Misc/colors.dart';

class BoxButton extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;

  BoxButton(
      {super.key,
      this.isIcon = false,
      this.text = "Error",
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 1.0,
          )),
      child: isIcon == false ? Center(child: TextWidget(text: text!, color: color, size: 18,)) : Center(child: Icon(icon, color: color,)),
    );
  }
}
