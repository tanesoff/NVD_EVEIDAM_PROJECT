import 'package:eve_idam/Screens/Events/Events_main.dart';
import 'package:eve_idam/Screens/Places/Places_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    Events(),
    Places()
  ];

  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          // BottomNavigationBarItem(label: "SideBar", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Events", icon: Icon(Icons.event_available)),
          BottomNavigationBarItem(label: "Places", icon: Icon(Icons.place)),
        ],
      ),

    );
  }
}
