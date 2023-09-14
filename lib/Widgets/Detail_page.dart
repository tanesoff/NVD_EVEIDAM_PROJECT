import 'package:eve_idam/Misc/colors.dart';
import 'package:eve_idam/Widgets/App_buttons.dart';
import 'package:eve_idam/Widgets/ResponsiveButton.dart';
import 'package:eve_idam/Widgets/Text.dart';
import 'package:eve_idam/cubit/App_cubit_states.dart';
import 'package:eve_idam/cubit/App_cubits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state){
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(detail.place.img),
                          fit: BoxFit.cover),
                    ),
                  )),
              Positioned(
                left: 20,
                top: 70,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: Icon(Icons.menu),
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 330,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text: detail.place.name,
                            font_wieght: FontWeight.bold,
                            color: Colors.black54.withOpacity(0.8),
                          ),
                          TextWidget(
                            text: '\$\$',
                            color: AppColors.mainColor,
                            font_wieght: FontWeight.bold,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TextWidget(
                            text: "Mkd, Skopje",
                            color: AppColors.mainTextColor,
                            size: 18,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                                  (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < detail.place.stars
                                      ? AppColors.starColor
                                      : AppColors.textColor2,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          TextWidget(
                            text: "(5.0)",
                            color: AppColors.textColor2,
                            size: 16,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextWidget(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                        font_wieght: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: "Number of people in your group",
                        color: AppColors.mainTextColor,
                        size: 15,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(
                          5,
                              (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: BoxButton(
                                    size: 50,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    text: (index + 1).toString(),
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    isIcon: false),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                        font_wieght: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                        text:
                        detail.place.description,
                        color: AppColors.mainTextColor,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    BoxButton(
                        size: 60,
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        icon: Icons.favorite_border,
                        isIcon: true,
                        borderColor: AppColors.textColor2),
                    SizedBox(width: 20,),
                    ResponsiveButton(
                      isResponsive: true,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
