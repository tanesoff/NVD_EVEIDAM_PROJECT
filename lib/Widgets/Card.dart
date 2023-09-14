import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String image;

  const CardWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(right: 10),
          width: 373,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          ),
        );
      },
    );
  }
}
