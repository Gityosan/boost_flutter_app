import 'package:flutter/material.dart';
import "./edit_profile.dart";

class ProfilePage extends StatelessWidget {
  ProfilePage({required this.isMainScreen});

  static const userImage = "https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png";
  static const joinedEvents = ["かくれんぼ", "じゃんけん大会", "だるまさんがころんだ"];
  static const Color themeColor = Colors.cyan;
  final isMainScreen;
  
  @override
  Widget build(BuildContext context) {
    return isMainScreen ? 
      Scaffold(
        body: profileContent(context)
      ) : 
      Scaffold(
        appBar: AppBar(
          title: Text("プロフィール"),
          backgroundColor: themeColor,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            icon: Icon(Icons.arrow_back)
          ),
        ),
        body: profileContent(context)
      );
  }

  Widget profileContent(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            profileItem(),
            if(isMainScreen) editButton(context)
          ],
        ),
        Column(
          children: [
            Text("過去に開催したイベント"),
            Padding(padding: EdgeInsets.all(5)),
            eventItem("鬼ごっこ"),
            Padding(padding: EdgeInsets.all(5)),
            Text("過去に参加したイベント"),
            Padding(padding: EdgeInsets.all(5)),
            eventItem(joinedEvents[0]),
            eventItem(joinedEvents[1]),
            eventItem(joinedEvents[2]),
          ],
        )
      ],
    );
  }

  Widget profileItem() {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      color: Colors.lightBlueAccent.shade100,
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
            Container(
              height: 120,
              child: Text("一般的には、人物の経歴や紹介のことを指すが、コンピューター分野では、コンピューターを構成する機器の種類や搭載されたOSのバージョンなどの情報のことを指す。"),
            )
          ]
        ),
      )
    );  
  }

  Widget editButton(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 25, right: 10),
      child: RawMaterialButton(
        child: Icon(Icons.edit),
        fillColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => EditProfilePage(),
            )
          );
        },
        shape: CircleBorder(),
      )
    );
  }

  Widget eventItem(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child: ListTile(
        leading: Icon(Icons.event),
        title: Text(
          title,
          style: TextStyle(
            color:Colors.black,
            fontSize: 18.0
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
