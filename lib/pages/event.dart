import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  static const userImage =
      "https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png";
  final listItem = [
    {
      "id": 1,
      "name": "山田太郎",
      "introduction": "フットサルしませんか",
      "status": "九州工業大学グラウンド"
    },
    {
      "id": 2,
      "name": "田中次郎",
      "introduction": "5人制度ラグビーしませんか",
      "status": "九州工業大学グラウンド"
    },
    {"id": 3, "name": "中島三郎", "introduction": "麻雀しませんか", "status": "俺の家"},
    {"id": 4, "name": "中島四郎", "introduction": "ポケカしませんか", "status": "食堂"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return eventCard(index);
      },
      itemCount: listItem.length,
    );
  }

  Widget eventCard(index) {
    return Card(
        child: Row(children: [
      Image.network(userImage, height: 60.0, width: 80.0),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          child: Text(
            '${listItem[index]["introduction"]}',
            style: TextStyle(fontSize: 20.0),
          ),
          padding: EdgeInsets.all(10.0),
        ),
        Padding(
          child: Row(children: [
            Container(
              width: 50.0,
              height: 50.0,
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
                      fit: BoxFit.fill, image: NetworkImage(userImage))),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Text(
              '${listItem[index]["name"]}',
              style: TextStyle(fontSize: 20.0),
            ),
          ]),
          padding: EdgeInsets.all(10.0),
        ),
        Padding(
          child: Row(children: [
            Icon(
              Icons.pin_drop,
              color: const Color(0xFF000000),
              // size: 48.0
            ),
            Text(
              '${listItem[index]["status"]}',
              style: TextStyle(fontSize: 18.0),
            ),
          ]),
          padding: EdgeInsets.all(10.0),
        ),
      ])
    ]));
  }
}
