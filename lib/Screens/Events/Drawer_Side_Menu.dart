import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text("Rap"),
          ),
          ListTile(
            title: const Text("Rock"),
          )
        ],
      ),
    );
  }
}
