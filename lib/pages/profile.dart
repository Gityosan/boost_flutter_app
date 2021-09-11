import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const userImage = "https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            elevation: 10,
            margin: EdgeInsets.all(20),
            color: Colors.lightBlueAccent,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
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
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "山田太郎",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Text("3年"),
                          Text("知り合った人数：100人"),
                          Text("タグ：プログラマー"),
                        ]
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Text("一般的には、人物の経歴や紹介のことを指すが、コンピューター分野では、コンピューターを構成する機器の種類や搭載されたOSのバージョンなどの情報のことを指す。")
                ]
              ),
            )
          ),
          Column(
            children: [
              Text("過去に開催したイベント"),
              Text("過去に参加したイベント"),
            ],
          )
        ],
      )

      
    );
  }
}
