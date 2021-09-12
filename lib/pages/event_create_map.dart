import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './event_create_form.dart';

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
          googleMap(),
          pinIcon(),
          createPositionButton(context)
        ],
      )
    );
  }

  Widget googleMap() {
    return GoogleMap(
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
    );
  }

  Widget pinIcon() {
    return Align(
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
    );
  }

  Widget createPositionButton(context) {
    return Align(
      alignment: Alignment.center,
      child: 
        Container(
          padding: EdgeInsets.only(top: 250),
          child: ElevatedButton(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Icon(Icons.add_location_alt),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.cyan,
              onPrimary: Colors.white,
              shape: StadiumBorder(),
            ),
            onPressed: () async {
              print(createPosition);
              Navigator.of(context).pop();
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => EventCreateForm(createPosition: createPosition),
              ));
            },
          )
        ),
    );
  }
}