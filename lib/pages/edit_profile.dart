import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geoint/main.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'components/button.dart';


class EditProfilePage extends StatefulWidget {
  EditProfilePage({
    required this.isEdit,
    required this.userName, 
    required this.userGrade, 
    required this.userTag,
    required this.userIntroduction,
  });
  
  final bool isEdit;
  final String userName;
  final int userGrade;
  final String userTag;
  final String userIntroduction;

  @override
  _EditProfilePageState createState() => _EditProfilePageState(
    isEdit: isEdit,
    userName: userName,
    userGrade: userGrade,
    userTag: userTag,
    userIntroduction: userIntroduction,
  );
}
class _EditProfilePageState extends State<EditProfilePage> {
  _EditProfilePageState({
    required this.isEdit,
    required this.userName, 
    required this.userGrade, 
    required this.userTag,
    required this.userIntroduction,
  });

  final bool isEdit;
  final String userName;
  final int userGrade;
  final String userTag;
  final String userIntroduction;

  static const userImage = "https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png";

  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("プロフィールの" + (isEdit ? "編集" : "登録")),
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
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
              // textFormField("タグ", isEdit ? userTag : ""),
              textFormFieldMultiLine("自己紹介", isEdit ? userIntroduction : ""),
              Padding(padding: EdgeInsets.all(10)),
              Button(
                buttonText: isEdit ? '変更': '登録', 
                onPressed: () {
                  isEdit ? Get.back() : Get.offAll(HomePage());
                  ScaffoldMessenger.of(context).showSnackBar(
                    // SnackBar表示
                    SnackBar(
                      content: Text(
                        isEdit ? "プロフィールを変更しました" : "ユーザーを登録しました"
                      ),
                    ),
                  );
                }
              ),
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
        
      ),
      child: (_image == null) ? 
        ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: Image.network(
            userImage, 
            height: 140, 
            width: 140,
          ),
        ) :
        ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: Image.file(
            _image!, 
            height: 140, 
            width: 140,
          ),
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
            final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
            setState(() {
              _image = File(pickedImage!.path);
            });
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
