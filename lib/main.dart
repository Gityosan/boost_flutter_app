import 'package:shared_preferences/shared_preferences.dart';

import 'amplifyconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geoint/amplifyconfiguration.dart';
import 'package:geoint/pages/login.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:get/get.dart';

import './pages/map.dart';
import './pages/event.dart';
import './pages/profile.dart';
import './pages/event_create_map.dart';
import './pages/login_require.dart';

class AuthController extends GetxController {
  var identityId = ''.obs;
  var owner = ''.obs;
  var isAuth = false.obs;
  var userInfo = {}.obs;

  void setIdentityId(String input) {
    identityId.value = input;
    isAuth.value = (input != '');
  }

  void setOwner(String input) {
    owner.value = input;
  }

  void setUserInfo(Map input) {
    userInfo.value = input;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Geoint - Booost',
      theme: ThemeData(
        primaryColor: Colors.cyan[300],
        appBarTheme: AppBarTheme(backgroundColor: Colors.cyan[300]),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.cyan[300], selectedItemColor: Colors.black),
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
  final AuthController authController = Get.find();
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


  late List<Widget> _pageList = [
    Obx(() => MapPage(
      initialPosition: _initialPosition, 
      isLogin: authController.isAuth.value
    )
    ),
    Obx(() => authController.isAuth.value
      ? EventPage() : LoginRequirePage()
    ),
    Obx(() => authController.isAuth.value 
      ? ProfilePage(isMainScreen: true) : LoginRequirePage()
    )
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

    _configureAmplify();
    getIsAuth();

    _getUserLocation();
    _loading = true;
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
  }

  Future getIsAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final _isAuth = prefs.getBool('isAuth');
    authController.isAuth.value = (_isAuth != null) ? _isAuth : false;
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

  void _configureAmplify() async {
    Amplify.addPlugin(AmplifyAPI());
    Amplify.addPlugins([AmplifyAuthCognito()]);
    try {
      await Amplify.configure(amplifyconfig);
      print('amplifyと繋がった');
    } catch (e) {
      print('残念');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedItems[this._selectedIndex]),
        actions: [appBarActionsButton()],
      ),
      body: _loading
          ? CircularProgressIndicator()
          : PageView(
              physics: NeverScrollableScrollPhysics(),
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
          }),
    );
  }

  Widget appBarActionsButton() {
    return Obx(() => 
      (this._selectedIndex != 1 || !authController.isAuth.value)
        ? TextButton(
            onPressed: () async {
              authController.isAuth.value 
                ? showLogoutDialog() : Get.to(LoginPage());
            },
            child: Row(children: [
              Padding(padding: EdgeInsets.all(5)),
              Icon(
                authController.isAuth.value 
                  ? Icons.logout : Icons.login,
                color: Colors.black
              ),
              Padding(padding: EdgeInsets.all(5)),
              Text(
                authController.isAuth.value 
                  ? 'ログアウト' : 'ログイン',
                style: TextStyle(color: Colors.black)
              ),
              Padding(padding: EdgeInsets.all(5)),
            ])
        )
        : TextButton(
            onPressed: () {
              Get.to(EventCreateMap(initialPosition: _initialPosition));
            },
            child: Row(children: [
              Padding(padding: EdgeInsets.all(5)),
              Icon(Icons.add, color: Colors.black),
              Padding(padding: EdgeInsets.all(2)),
              Text('イベント作成', style: TextStyle(color: Colors.black)),
              Padding(padding: EdgeInsets.all(5)),
            ])
        )
    );
  }

  Future showLogoutDialog() {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("お知らせ"),
            content: Text("ログアウトします。よろしいですか？"),
            actions: <Widget>[
              TextButton(
                child: Text("YES"),
                onPressed: () => {
                  logOut(),
                  Navigator.pop(context),
                }
              ),
              TextButton(
                child: Text("NO"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  Future<void> logOut() async {
    try {
      await Amplify.Auth.signOut();
      print('ログアウトOK');
    } on AuthException catch (authError) {
      print('一生ログアウトできないアカウントです');
    }
  }
}
