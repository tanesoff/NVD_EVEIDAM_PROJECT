import 'package:eve_idam/Screens/Nav/Main_page.dart';
import 'package:eve_idam/Screens/Welcome/Welcome_page.dart';
import 'package:eve_idam/cubit/App_cubit_logics.dart';
import 'package:eve_idam/cubit/App_cubits.dart';
import 'package:eve_idam/cubit/Data_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Widgets/Detail_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AppCubits>(
        create: (context)=>AppCubits(
          data: DataServies(),
        ),
        child: AppCubitLogics(),
      ),
    );
  }
}
