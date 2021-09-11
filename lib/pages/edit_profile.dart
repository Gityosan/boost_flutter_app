import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'components/button.dart';

class EditProfilePage extends StatelessWidget {
  static const Color themeColor = Colors.cyan;
  static const userImage = "https://cdn-images-1.medium.com/max/1200/1*ilC2Aqp5sZd1wi0CopD1Hw.png";

  late final XFile pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("プロフィールの編集"),
        backgroundColor: themeColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          icon: Icon(Icons.arrow_back)
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                _circleIcon(),
                _editCircleIcon(context)
              ],
            ),
            _textFormField("名前", "山田太郎"),
            _textFormFieldNumberOnly("学年", "3"),
            _textFormField("タグ", "プログラマー"),
            _textFormFieldMultiLine("自己紹介", "山田 太郎は、日本の政治家、実業家、教育者。自由民主党所属の参議院議員。表現の自由を守る会会長。エンターテイメント表現の自由の会名誉顧問。"),
            Button(buttonText: '変更', onPressed: () => {
              Navigator.of(context).pop()
            })
          ]
        )
      ),
    );
  }

  // ユーザーのアイコン
  Widget _circleIcon() {
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
  Widget _editCircleIcon(context) {
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
  Widget _textFormField(String label, String value) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }

  // 数字のみのテキストフォーム
  Widget _textFormFieldNumberOnly(String label, String value) {
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
  Widget _textFormFieldMultiLine(String label, String value) {
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