import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import './profile.dart';

class MapPage extends StatelessWidget {
  MapPage({required this.initialPosition});

  final Completer<GoogleMapController> _mapController = Completer();
  final LatLng initialPosition;
  var isJoinedEvent = false;
  static const events = {
    'id': 'event0001',
    'title': "第512回フットサル大会",
    'image': 'https://cerezo-futsalpark.com/images/index/img03.jpg',
    "introduction": "フットサル (Futsal) は、いわゆる室内サッカーである南米の「サロンフットボール（ポルトガル語版）」または英国の「インドアサッカー（英語版）」を起源とする、基本的には室内で行われる、サッカーに似た競技である。",
    "join": 8,
    "limit": 10,
    "lat": 33.65491150017191,
    "lng": 130.6743086501956,
    "start": "2021/09/15 13:00",
    "end": "2021/09/15 15:00",
  };
  static const userImage = "https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png";
  
  Set<Marker> _createMarker(context) {
    return {
      Marker(
        markerId: MarkerId(events["id"].toString()),  // event id
        position: LatLng(double.parse(events["lat"].toString()), double.parse(events["lng"].toString())),
        infoWindow: InfoWindow(title: events["title"].toString()),
        onTap: () {
          _showModalButtomSheet(context);
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

  void _showModalButtomSheet(context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (BuildContext modalContext) {
        return Container(
          height: 300,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(events["image"].toString()),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.dstATop
              )
            ),
          ),
          child: modalBottomContent(context, modalContext)
        );
      }
    );
  }

  Widget modalBottomContent(BuildContext context, BuildContext modalContext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: <Widget>[
            profileIcon(context),
            Padding(padding: EdgeInsets.all(5)),
            Text(
              events["title"].toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            )
          ],
        ),
        holdingTimeText(events["start"].toString(), events["end"].toString()),
        joinedPeopleText(events["join"].toString(), events["limit"].toString()),
        Flexible(child: Container(
          height: 90,
          child: Text(events["introduction"].toString()),
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
            joinButton(context, modalContext)
          ],
        ),
      ],
    );
  }

  Widget profileIcon(context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProfilePage(isMainScreen: false,),
          )
        );
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
            image: NetworkImage(userImage)
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
        showDialog(
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
      },
    );
  }
}