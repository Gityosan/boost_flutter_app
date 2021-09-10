import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  final Completer<GoogleMapController> _mapController = Completer();
  final LatLng initialPosition;

  MapPage({required this.initialPosition});

  @override
  Widget build(BuildContext context) {
    return Center(child: GoogleMap(
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
      onTap: (LatLng latLang) {
        print('Clicked: $latLang');
      },
    ));
  }
}