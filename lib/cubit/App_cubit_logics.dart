import 'package:eve_idam/Screens/Welcome/Welcome_page.dart';
import 'package:eve_idam/Widgets/Detail_page.dart';
import 'package:eve_idam/cubit/App_cubits.dart';
import 'package:eve_idam/cubit/App_cubit_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Screens/Nav/Main_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is DetailState){
            return DetailPage();
          } if(state is WelcomeState){
            return WelocmePage();
          }if(state is LoadedState){
            return MainPage();
          }if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
