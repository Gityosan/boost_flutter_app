import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './profile.dart';

class Event {
  final String id;
  final String name;
  // final Image image;
  final String image;
  final String introduction;
  final String place;
  final double lat;
  final double lng;
  final int limit;
  final int reserved;
  final String start;
  final String end; 
  final User user;

  Event({
    required this.id, 
    required this.name, 
    required this.image, 
    required this.introduction, 
    required this.place, 
    required this.lat, 
    required this.lng, 
    required this.limit, 
    required this.reserved,
    required this.start, 
    required this.end,
    required this.user
  });
}

class User {
  final String id;
  final String image;

  User({
    required this.id,
    required this.image
  });
}

final List<Event> eventData = [
  Event(
    id: '0001', 
    name: '第512回フットサル大会', 
    image: 'https://cerezo-futsalpark.com/images/index/img03.jpg', 
    introduction: 'フットサル (Futsal) は、いわゆる室内サッカーである南米の「サロンフットボール（ポルトガル語版）」または英国の「インドアサッカー（英語版）」を起源とする、基本的には室内で行われる、サッカーに似た競技である。', 
    place: '九工大グラウンド', 
    lat: 33.65491150017191, 
    lng: 130.6743086501956, 
    limit: 10, 
    reserved: 8, 
    start: '2021/09/15 13:00', 
    end: '2021/09/15 15:00',
    user: User(
      id: '0001',
      image: 'https://3.bp.blogspot.com/-KgUzGDeV8r8/VaMOD3z_X-I/AAAAAAAAvh8/YK5LucKKUmo/s170/boy_01.png'
    )
  ),
  Event(
    id: '0002', 
    name: '第256回大食い大会', 
    image: 'https://i1.wp.com/mitaiyomitai.com/wp-content/uploads/2021/04/%E3%82%AA%E3%82%B0%E3%83%AA%E3%82%AD%E3%83%A3%E3%83%83%E3%83%973.jpg', 
    introduction: '早食い（はやぐい）とは、食料や料理をともかく早く食べる行為である。大食い（おおぐい）とは、大量に食べる行為である。大食（たいしょく）ともいう。', 
    place: '九工大食堂', 
    lat: 33.65491150017191, 
    lng: 130.67262455821037, 
    limit: 3, 
    reserved: 0, 
    start: '2021/09/16 11:00', 
    end: '2021/09/16 13:00',
    user: User(
      id: '0002',
      image: 'https://2.bp.blogspot.com/-6JmvIZNh6v0/VaMNdoZ16HI/AAAAAAAAvX8/26ub6j9Uh4E/s170/girl_14.png'
    )
  ),
];

class MapPage extends StatefulWidget {
  MapPage({required this.initialPosition, required this.isLogin});
  final LatLng initialPosition;
  final bool isLogin;

  @override
  _MapPageState createState() => _MapPageState(
    initialPosition: initialPosition, 
    isLogin: isLogin
  );
}
class _MapPageState extends State<MapPage> {
  _MapPageState({required this.initialPosition, required this.isLogin});
  final LatLng initialPosition;
  final bool isLogin;

  final Completer<GoogleMapController> _mapController = Completer();
  var isJoinedEvent = false;
  
  Set<Marker> _createMarker(context) {
    return {
      for (int i = 0; i < eventData.length; i++) 
        Marker(
          markerId: MarkerId(eventData[i].id.toString()),  // event id
          position: LatLng(
              double.parse(eventData[i].lat.toString()),
              double.parse(eventData[i].lng.toString())
            ),
          infoWindow: InfoWindow(title: eventData[i].place.toString()),
          onTap: () {
            showModalButtomSheet(context, eventData[i]);
        }
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: GoogleMap(
      mapType: MapType.normal,
      markers: _createMarker(context),
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
      onTap: (LatLng latLang) {
        print('Clicked: $latLang');
      },
    ));
  }

  void showModalButtomSheet(BuildContext context, Event eventData) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext modalContext,) {
        return Container(
          height: 300,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(eventData.image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.dstATop
              )
            ),
          ),
          child: modalBottomContent(context, modalContext, eventData)
        );
      }
    );
  }

  Widget modalBottomContent(BuildContext context, BuildContext modalContext, Event eventData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: <Widget>[
            profileIcon(context, eventData.user.image),
            Padding(padding: EdgeInsets.all(5)),
            Text(
              eventData.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            )
          ],
        ),
        holdingTimeText(eventData.start, eventData.end),
        joinedPeopleText(eventData.reserved.toString(), eventData.limit.toString()),
        Flexible(child: Container(
          height: 90,
          child: Text(eventData.introduction),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "開催前",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 20
              ),
            ),
            if(isLogin) joinButton(context, modalContext)
          ],
        ),
      ],
    );
  }

  Widget profileIcon(BuildContext context, String image) {
    return GestureDetector(
      onTap: () {
        Get.to(ProfilePage(isMainScreen: false));
      },
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1.0,
              blurRadius: 10.0,
              offset: Offset(5, 5),
            ),
          ],
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 2),
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(image)
          )
        ),
      )
    );
  }

  Widget holdingTimeText(String startTime, String endTime) {
    return Row(
      children: <Widget>[
        Icon(Icons.access_time),
        Padding(padding: EdgeInsets.all(5)),
        Text(startTime + " ~ " + endTime)
      ],
    );
  }

  Widget joinedPeopleText(String attendedCount, String countMax) {
    return Row(
      children: <Widget>[
        Icon(Icons.people),
        Padding(padding: EdgeInsets.all(5)),
        Text(attendedCount + " / " + countMax)
      ],
    );
  }

  Widget joinButton(BuildContext context, BuildContext modalContext) {
    return ElevatedButton(
      child: isJoinedEvent ? 
        Text('参加済み', style: TextStyle( fontSize: 20 )) 
        : Text('参加する', style: TextStyle( fontSize: 20 )),
      style: ElevatedButton.styleFrom(
        primary: isJoinedEvent ? Colors.orange : Colors.cyan,
        onPrimary: Colors.black,
        shape: StadiumBorder(),
      ),
      onPressed: () {
        // todo: イベントに参加する処理を書く
        Navigator.pop(modalContext);
        showJoinButtonDialog();
      },
    );
  }

  Future showJoinButtonDialog() {
    return showDialog(
      context: context,
      builder: (_) {
        return isJoinedEvent ? 
          AlertDialog(
            title: Text("このイベントは参加済みです"),
            content: Text("参加をキャンセルしますか？"),
            actions: <Widget>[
              TextButton(
                child: Text("YES"),
                onPressed: () => {
                  isJoinedEvent = !isJoinedEvent,
                  Navigator.pop(context)
                }
              ),
              TextButton(
                child: Text("NO"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ) : AlertDialog(
            title: Text("お知らせ"),
            content: Text("イベントに参加しました"),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () => {
                  isJoinedEvent = !isJoinedEvent,
                  Navigator.pop(context)
                }
              ),
            ],
          );
        }
      );
  }
}