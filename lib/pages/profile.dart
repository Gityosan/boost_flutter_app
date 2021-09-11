import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.account_circle,
            color: Color(0xFF000000),
            size: 48.0
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "山田太郎",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"
                ),
              ),
              Text(
                "3年",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "知り合った人数: ",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"
                    ),
                  ),
                  Text(
                    "100人",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"
                    ),
                  ),
                ]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "タグ: ",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"
                    ),
                  ),
                  Text(
                    "プログラマー",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                  ),
                ]
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "こんにちは！知的システム工学科４年の太郎です！",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"
                    ),
                  ),
                ]
              )
            ]
          ),
        ]
      )  
    );
  }
}
