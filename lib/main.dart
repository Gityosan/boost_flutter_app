import 'package:flutter/material.dart';
import 'package:geoint/pages/login.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import './pages/map.dart';
import './pages/event.dart';
import './pages/profile.dart';

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
  static const selectedItems = ["マップ", "イベント", "プロフィール"];
  static const selectedItemIcons = [
    Icons.map, 
    Icons.event,
    Icons.account_circle_outlined,
  ];

  late List<Widget> _pageList = [
    MapPage(initialPosition: _initialPosition),
    EventPage(),
    ProfilePage(),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: Icon(selectedItemIcons[this._selectedIndex]),
        title: Text(selectedItems[this._selectedIndex]),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LoginPage(),
                )
              );
            }, 
            icon: Icon(Icons.login)
          )
        ],
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
        ],
        backgroundColor: themeColor,
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