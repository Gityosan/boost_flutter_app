import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

import './components/button.dart';

class EventCreateForm extends StatefulWidget {
  EventCreateForm({required this.createPosition});
  final LatLng createPosition;

  @override
  _EventCreateFormState createState() => _EventCreateFormState(
    createPosition: createPosition
  );
}

class _EventCreateFormState extends State<EventCreateForm> {
  _EventCreateFormState({required this.createPosition});
  final LatLng createPosition;
  
  static const Color themeColor = Colors.cyan;
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("イベント作成"),
        backgroundColor: themeColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(padding: EdgeInsets.all(30)),
              textFormField("イベントタイトル", ""),
              Padding(padding: EdgeInsets.all(5)),
              textFormField("場所の名前", ""),
              Padding(padding: EdgeInsets.all(5)),
              textFormFieldNumberOnly("開始終了日時", ""),
              Padding(padding: EdgeInsets.all(5)),
              textFormFieldNumberOnly("参加人数の上限", ""),
              Padding(padding: EdgeInsets.all(5)),
              textFormField("タグ", ""),
              Padding(padding: EdgeInsets.all(5)),
              textFormFieldMultiLine("説明", ""),
              Padding(padding: EdgeInsets.all(10)),
              eventImageButton(),
              Padding(padding: EdgeInsets.all(20)),
              eventCreatingButton(context)
            ]
          )
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

  Widget eventImageButton() {
    return ElevatedButton(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Icon(
          (_image == null) ? Icons.add_photo_alternate : Icons.check
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: (_image == null) ? Colors.cyan : Colors.greenAccent,
        onPrimary: Colors.white,
        shape: StadiumBorder(),
      ),
      onPressed: () async {
        final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
        setState(() {
          _image = File(pickedImage!.path);
        });
      },
    );
  }

  Widget eventCreatingButton(context) {
    return Button(
      buttonText: '作成',
      onPressed: () {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          // SnackBar表示
          SnackBar(
            content: Text("イベントを作成しました"),
          ),
        );
      }
    );
  }
}
