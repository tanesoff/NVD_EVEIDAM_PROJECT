import 'package:eve_idam/Misc/colors.dart';
import 'package:eve_idam/Widgets/ResponsiveButton.dart';
import 'package:eve_idam/cubit/App_cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Widgets/Text.dart';

class WelocmePage extends StatefulWidget {
  const WelocmePage({super.key});

  @override
  State<WelocmePage> createState() => _WelocmePageState();
}

class _WelocmePageState extends State<WelocmePage> {
  List images = ["skopje.jpg", "skopje2.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Images/" + images[index]),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.bottomRight,
                      end: FractionalOffset.topLeft,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ]
                    )
                  ),
                ),
                Container(
                  margin:
                  const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Events",
                            font_wieght: FontWeight.bold,
                            color: Colors.white,
                          ),
                          TextWidget(
                            text: "Skopje",
                            font_wieght: FontWeight.normal,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 250,
                            child: TextWidget(
                              size: 20,
                              text:
                              "Checkout skopje night nightlife",
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: (){
                              BlocProvider.of<AppCubits>(context, listen: false).getData();
                            },
                            child: Container(
                              width: 200,
                              child: Row(
                                children: [
                                  ResponsiveButton(
                                    width: 120,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(2, (indexDots){
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index == indexDots?25:8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots ? AppColors.buttonBackground: AppColors.buttonBackground.withOpacity(0.3)
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
