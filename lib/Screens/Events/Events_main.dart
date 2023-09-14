import 'package:eve_idam/Misc/CircleTabIndicator.dart';
import 'package:eve_idam/Misc/colors.dart';
import 'package:eve_idam/Widgets/Text.dart';
import 'package:eve_idam/cubit/App_cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Widgets/Card.dart';
import '../../cubit/App_cubit_states.dart';
import 'Drawer_Side_Menu.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> with TickerProviderStateMixin {
  var images = {
    "ohrid.jpg" : "Ohrid",
    "skopje.jpg" : "Skopje",
    "Friends.png" : "Friends",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is LoadedState){
            var info = state.places;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   padding: const EdgeInsets.only(top: 70, left: 20),
                  //   child: Row(
                  //     children: [
                  //       IconButton(
                  //         onPressed: () {
                  //           Scaffold.of(context).openDrawer();
                  //         },
                  //         icon: Icon(
                  //           Icons.menu,
                  //           size: 30,
                  //           color: Colors.black54,
                  //         ),
                  //       ),
                  //       Expanded(child: Container()),
                  //       Container(
                  //         margin: const EdgeInsets.only(right: 20),
                  //         width: 50,
                  //         height: 50,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             color: Colors.grey.withOpacity(0.5)),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  //Events Text
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: TextWidget(
                      text: "Events",
                      font_wieght: FontWeight.bold,
                      size: 35,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding: const EdgeInsets.only(left: 40, right: 40),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator:
                        CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                        controller: _tabController,
                        tabs: [
                          Tab(
                            text: "Jazz",
                          ),
                          Tab(
                            text: "Rap",
                          ),
                          Tab(
                            text: "Rock",
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tabController,
                      children: [

                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          height: 300,
                          width: double.maxFinite,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              ListView.builder(
                                itemCount: info.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index){
                                  return GestureDetector(
                                    onTap: (){
                                      BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 5, top: 15),
                                      width: 365,
                                      height: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        image: DecorationImage(
                                          // image: NetworkImage('http://mark.bslmeiyu.com/uploads/' + info[index].img),
                                          image: NetworkImage(info[index].img),
                                          fit: BoxFit.cover
                                        )
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        
                        Text("Viktor"),
                        Text("Zdravo")
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Explore more",
                          size: 22,
                          font_wieght: FontWeight.bold,
                        ),
                        TextWidget(
                          text: "See all",
                          color: AppColors.textColor1,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 120,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(left: 10),
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage("./Images/" + images.keys.elementAt(index)), fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(height:5,),
                              Container(
                                width: 100,
                                alignment: Alignment.center,
                                child: TextWidget(
                                  text: images.values.elementAt(index),
                                  color: AppColors.textColor2,
                                  size: 18,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }else{
            return Container();
          }
        },
      ),
      drawer: DrawerNav(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        iconTheme: IconThemeData(color: Colors.black87),
        leading: Builder(
          builder: (BuildContext context){
            return Container(
              margin: EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(Icons.menu,),
                iconSize: 40,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            );
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 20),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}

