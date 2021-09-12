import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geoint/pages/login.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import './pages/map.dart';
import './pages/event.dart';
import './pages/profile.dart';
import './pages/event_create_map.dart';
import './pages/login_require.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geoint - Booost',
      theme: ThemeData(
        primaryColor: Colors.cyan[300],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.cyan[300]
        ),
        bottomNavigationBarTheme: 
          BottomNavigationBarThemeData(
            backgroundColor: Colors.cyan[300],
            selectedItemColor: Colors.black
          ),
      ),
      home: HomePage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en"),
        Locale("ja"),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  late bool _loading;
  late LatLng _initialPosition;

  late int _selectedIndex = 0;
  static const selectedItems = ["マップ", "イベント", "プロフィール"];
  static const selectedItemIcons = [
    Icons.map,
    Icons.event,
    Icons.account_circle_outlined,
  ];

  late bool isLogin = true;

  late List<Widget> _pageList = [
    MapPage(initialPosition: _initialPosition, isLogin : isLogin),
    isLogin ? EventPage() : LoginRequirePage(),
    isLogin ? ProfilePage(isMainScreen: true) : LoginRequirePage(),
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
        title: Text(selectedItems[this._selectedIndex]),
        actions: <Widget>[appBarActionsButton()],
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
            label: selectedItems[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedItemIcons[1]),
            label: selectedItems[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedItemIcons[2]),
            label: selectedItems[2],
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(index);
          });
        }
      ),
    );
  }

  Widget appBarActionsButton() {
    return (this._selectedIndex != 1 || !isLogin) ?
      TextButton(
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => LoginPage(),
          ));
        },
        child: Row(
          children: [
            Padding(padding: EdgeInsets.all(5)),
            Icon(
              isLogin ? Icons.logout : Icons.login, 
              color: Colors.black
            ),
            Padding(padding: EdgeInsets.all(5)),
            Text(
              isLogin ? 'ログアウト' : 'ログイン', 
              style: TextStyle(color: Colors.black)
            ),
            Padding(padding: EdgeInsets.all(5)),
          ]
        )
      ) :
      TextButton(
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => EventCreateMap(initialPosition: _initialPosition),
          ));
        },
        child: Row(
          children: [
            Padding(padding: EdgeInsets.all(5)),
            Icon(Icons.add, color: Colors.black),
            Padding(padding: EdgeInsets.all(2)),
            Text('イベント作成', style: TextStyle(color: Colors.black)),
            Padding(padding: EdgeInsets.all(5)),
          ]
        )
      );
  }
}
