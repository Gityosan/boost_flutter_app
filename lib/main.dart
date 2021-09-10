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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  static const Color themeColor = Colors.cyan;

  late bool _loading;
  late LatLng _initialPosition;

  late int _selectedIndex = 0;
  static const selectedItems = ["マップ", "イベント", "ユーザー", "設定"];
  static const selectedItemIcons = [
    Icons.map, 
    Icons.event,
    Icons.account_circle_outlined,
    Icons.settings
  ];

  late List<Widget> _pageList = [
    MapPage(initialPosition: _initialPosition),
    EventPage(),
    UserPage(),
    SettingPage()
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Widget作成時
  @override
  void initState() {
    super.initState();
    _loading = true;
    _getUserLocation();
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
  }

  // State削除時
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 現在地を取得
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
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: Icon(selectedItemIcons[this._selectedIndex]),
        title: Text(selectedItems[this._selectedIndex]),
      ),
      body: _loading
        ? CircularProgressIndicator()
        : PageView(
            physics: new NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _pageList,
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(selectedItemIcons[0]),
            title: Text(selectedItems[0]),
            backgroundColor: themeColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedItemIcons[1]),
            title: Text(selectedItems[1]),
            backgroundColor: themeColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedItemIcons[2]),
            title: Text(selectedItems[2]),
            backgroundColor: themeColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedItemIcons[3]),
            title: Text(selectedItems[3]),
            backgroundColor: themeColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          });
        }
      ),
    );
  }
}

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

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("User Page"),
    );
  }
}

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Setting Page"),
    );
  }
}