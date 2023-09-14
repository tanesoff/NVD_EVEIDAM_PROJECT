import 'package:eve_idam/Misc/colors.dart';
import 'package:eve_idam/Widgets/Text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? text;

  ResponsiveButton({
    super.key,
    this.width = 120,
    this.isResponsive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width:  isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            isResponsive == true ? Container(margin: const EdgeInsets.only(left: 20), child: TextWidget(text: "Reserve now", color: Colors.white, size: 18,)) : Container(),
            Image.asset("Images/button-one.png")
          ],
        ),
      ),
    );
  }
}
