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
  
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  File? _image;

  var startTime;
  var endTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("イベント作成"),
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
              Padding(padding: EdgeInsets.all(15)),
              textFormField("イベントタイトル", ""),
              Padding(padding: EdgeInsets.all(5)),
              textFormField("場所の名前", ""),
              Padding(padding: EdgeInsets.all(5)),
              textFormFieldNumberOnly("参加人数の上限", ""),
              Padding(padding: EdgeInsets.all(5)),
              textFormFieldMultiLine("説明", ""),
              Padding(padding: EdgeInsets.all(15)),
              selectDateTimeButton("開始日時選択", context),
              Padding(padding: EdgeInsets.all(5)),
              selectDateTimeButton("終了日時選択", context),
              Padding(padding: EdgeInsets.all(15)),
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

  Widget selectDateTimeButton(String text, context) {
    return ElevatedButton(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: (text == "開始日時選択") ? 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (startTime != null) Icon(Icons.check),
              if (startTime != null) Padding(padding: EdgeInsets.all(5)),
              Text(text, style: TextStyle( fontSize: 20 ))
            ],
          )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (endTime != null) Icon(Icons.check),
                if (endTime != null) Padding(padding: EdgeInsets.all(5)),
                Text(text, style: TextStyle( fontSize: 20 ))
              ],
            )
      ),
      style: ElevatedButton.styleFrom(
        primary: (text == "開始日時選択") ? 
          ((startTime == null) ? Colors.cyan : Colors.green) : 
          ((endTime == null) ? Colors.cyan : Colors.green),
        onPrimary: Colors.white,
        shape: StadiumBorder(),
      ),
      onPressed: () {
        _selectDate(text, context);
      },
    );
  }

  Future<Null> _selectDate(String text, BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      locale: Locale("ja"),
      initialDate: _date,
      firstDate: DateTime(_date.year),
      lastDate: DateTime.now().add(Duration(days: 360)),
    );
    if (picked != null) setState(() => {
      _date = picked,
      _selectTime(text, context)
    });
  }

    Future<Null> _selectTime(String text, BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: _time,
    );
    if(picked != null) setState(() => {
      _time = picked,
      if (text == "開始日時選択") {
        startTime = DateTime(
          _date.year,
          _date.month,
          _date.day,
          _time.hour,
          _time.minute
        ),
        print(startTime)
      } else {
        endTime = DateTime(
          _date.year,
          _date.month,
          _date.day,
          _time.hour,
          _time.minute
        ),
        print(endTime)
      }
    });
  }

  Widget eventImageButton() {
    return ElevatedButton(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null) Icon(Icons.check),
            if (_image != null) Padding(padding: EdgeInsets.all(5)),
            Text("画像の選択", style: TextStyle( fontSize: 20 ))
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: (_image == null) ? Colors.cyan : Colors.green,
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
