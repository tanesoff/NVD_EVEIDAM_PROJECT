import 'dart:async';
import 'dart:typed_data';

import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Places extends StatefulWidget {
  const Places({super.key});

  @override
  State<Places> createState() => _PlacesState();
}




class _PlacesState extends State<Places> {
  Completer<GoogleMapController> _mapController = Completer();

  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(41.99646, 21.43141),
    zoom: 15,
  );

  final List<Marker> _markers = <Marker>[];

  final List<LatLng> _latLen = <LatLng>[
    LatLng(41.99632439336709, 21.424715198939584),
    LatLng(42.00750075853684, 21.4209583529212),
    LatLng(42.006320871030155, 21.422632051160203),
    LatLng(41.991268968631275, 21.42557350572881),
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }



  loadData() async{
    var url = 'https://cdn-icons-png.flaticon.com/512/3226/3226228.png';
    var bytes = (await NetworkAssetBundle(Uri.parse(url)).load(url)).buffer.asUint8List();
    _markers.add(
        Marker(
          markerId: MarkerId('test'),
          position: _latLen[0],),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('test1'),
        position: _latLen[1],),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('test2'),
        position: _latLen[2],),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('test3'),
        position: _latLen[3],),
    );

    setState((){});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGoogle,
        markers: Set<Marker>.of(_markers),
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        onMapCreated: (GoogleMapController controller){
          _mapController.complete(controller);
        },
      ),
    );
  }
}
