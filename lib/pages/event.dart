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
      "introduction": "5人制ラグビーしませんか",
      "status": "九州工業大学グラウンド"
    },
    {"id": 3, "name": "中島三子", "introduction": "麻雀しませんか", "status": "私の家"},
    {"id": 4, "name": "中島四子", "introduction": "ポーカーしませんか", "status": "食堂"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(5),
      itemBuilder: (BuildContext context, int index) {
        return eventCard(index);
      },
      itemCount: listItem.length,
    );
  }

  Widget eventCard(index) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/field${index}.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.dstATop
            )
          ),
        ),
        child: Row(children: [
          Padding(padding: EdgeInsets.all(10)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              child: Text(
                '${listItem[index]["introduction"]}',
                style: TextStyle(fontSize: 20.0),
              ),
              padding: EdgeInsets.all(10.0),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
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
                          fit: BoxFit.fill, 
                          image: AssetImage('images/people${index}.png')
                      )
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    '${listItem[index]["name"]}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ]
              ),
            ),
            Padding(
              child: Row(
                children: [
                Icon(
                  Icons.pin_drop,
                  color: Color(0xFF000000),
                  // size: 48.0
                ),
                Padding(padding: EdgeInsets.all(5)),
                Text(
                  '${listItem[index]["status"]}',
                  style: TextStyle(fontSize: 18.0),
                ),
                ]),
              padding: EdgeInsets.all(10.0),
            ),
          ])
        ])
      )
    );
  }
}
