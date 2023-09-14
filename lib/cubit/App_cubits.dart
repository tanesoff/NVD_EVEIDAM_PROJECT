import 'package:bloc/bloc.dart';
import 'package:eve_idam/Model/Data_model.dart';
import 'package:eve_idam/cubit/App_cubit_states.dart';

import 'Data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }

  final DataServies data;
  late final places;
  void getData() async{
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }catch(e){

    }
  }

  detailPage(DataModel data){
    emit(DetailState(data));
  }
  
  goHome(){
    emit(LoadedState(places));
  }
}