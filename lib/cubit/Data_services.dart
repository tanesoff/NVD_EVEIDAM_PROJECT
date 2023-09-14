import 'dart:convert';

import 'package:eve_idam/Model/Data_model.dart';
import 'package:http/http.dart' as http;

class DataServies{
  String baseUrl = "https://7b666ca9-3a31-4f2f-9c94-f14a43a84f96.mock.pstmn.io/eveIdam";
  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getPlaces';
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));

    try{
      if(res.statusCode == 200){
        List<dynamic> list = json.decode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];
      }
    }catch(e){
      print(e);
      return <DataModel>[];
    }
  }
}