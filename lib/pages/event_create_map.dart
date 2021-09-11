import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'components/button.dart';

class EventCreateMap extends StatelessWidget {
  EventCreateMap({required this.initialPosition});

  final Completer<GoogleMapController> _mapController = Completer();
  final LatLng initialPosition;
  static const Color themeColor = Colors.cyan;
  late LatLng createPosition;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("イベント作成"),
        backgroundColor: themeColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back)),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: initialPosition,
              zoom: 16.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapToolbarEnabled: false,
            buildingsEnabled: true,
            compassEnabled: true,
            onCameraMove: (CameraPosition position) {
              createPosition = position.target;
            },
            onTap: (LatLng latLang) {
              print('Clicked: $latLang');
            },
          ),
          Align(
            alignment: Alignment.center,
            child: 
              Container(
                padding: EdgeInsets.only(bottom: 52.5),
                child: Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  size: 50,
                  color: Colors.red,
                ),
              ),
          ),
          Align(
            alignment: Alignment.center,
            child: 
              Container(
                padding: EdgeInsets.only(top: 250),
                child: Button(
                  buttonText: "作成", 
                  onPressed: () {
                    print(createPosition);
                    Navigator.of(context).pop();
                    // todo: イベント作成フォームを開く
                  }
                )
              ),
          ),
        ],
      )
    );
  }
}