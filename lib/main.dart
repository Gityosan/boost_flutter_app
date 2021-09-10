import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geoint - Booost',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State createState() => MapSampleState();
}

class MapSampleState extends State {
  final Completer<GoogleMapController> _mapController = Completer();
  late LatLng _initialPosition;
  late bool _loading;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _getUserLocation();
  }

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      _loading = false;
      print(position);
    });
  }

  @override
  Widget build(BuildContext context) { //
    final List<Widget> _widgetOptions = <Widget>[
      GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: _initialPosition,
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
      ),
      ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Album'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
        ],
      ),
      Text(
        'Index 2: School',
      ),
      Text(
        'Index 3: Settings',
      ),
    ];


    return new Scaffold(
      appBar: AppBar(
        title: Text("Geoint"),
      ),
      body: _loading
          ? CircularProgressIndicator()
          : Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('マップ'),
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('イベント'),
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            title: Text('ユーザー'),
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('設定'),
            backgroundColor: Colors.cyan,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  // タップ時の処理
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}