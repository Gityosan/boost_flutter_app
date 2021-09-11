import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'components/button.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({
    required this.isEdit,
    required this.userName, 
    required this.userGrade, 
    required this.userTag,
    required this.userIntroduction,
  });

  static const Color themeColor = Colors.cyan;
  static const userImage = "https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png";

  late final XFile pickedImage;

  final bool isEdit;
  final String userName;
  final int userGrade;
  final String userTag;
  final String userIntroduction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("プロフィールの" + (isEdit ? "編集" : "登録")),
        backgroundColor: themeColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          icon: Icon(Icons.arrow_back)
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(padding: EdgeInsets.all(30)),
              Stack(
                children: [
                  circleIcon(),
                  editCircleIcon(context)
                ],
              ),
              textFormField("名前", isEdit ? userName : ""),
              textFormFieldNumberOnly("学年", isEdit ? userGrade.toString() : ""),
              textFormField("タグ", isEdit ? userTag : ""),
              textFormFieldMultiLine("自己紹介", isEdit ? userIntroduction : ""),
              Padding(padding: EdgeInsets.all(10)),
              Button(
                buttonText: isEdit ? '変更': '登録', 
                onPressed: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    // SnackBar表示
                    SnackBar(
                      content: Text(
                        isEdit ? "プロフィールを変更しました" : "ユーザーを登録しました"
                      ),
                    ),
                  );
                }
              )
            ]
          )
        )
      ),
    );
  }

  // ユーザーのアイコン
  Widget circleIcon() {
    return Container(
      width: 150.0,
      height: 150.0,
      margin: EdgeInsets.all(0),
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
    );
  }

  // ユーザーのアイコンの編集ボタン
  Widget editCircleIcon(context) {
    return Positioned(
      bottom: 0,
      left: 85,
      child: Container(
        child: RawMaterialButton(
          child: Icon(Icons.edit),
          fillColor: Colors.blue,
          onPressed: () async {
            await ImagePicker().pickImage(source: ImageSource.gallery);
            // 画像の処理わからん
          },
          shape: CircleBorder(),
        )
      )
    );
  }
  
  // 普通のテキストフォーム
  Widget textFormField(String label, String value) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }

  // 数字のみのテキストフォーム
  Widget textFormFieldNumberOnly(String label, String value) {
    return TextFormField(
      initialValue: value,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }

  // 複数行のテキストフォーム
  Widget textFormFieldMultiLine(String label, String value) {
    return TextFormField(
      initialValue: value,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  } 
}
