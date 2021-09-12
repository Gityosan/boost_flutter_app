import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import './components/button.dart';
import 'dart:io';

class EventCreateForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(50),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _textFormField("募集内容", ""),
                  _textFormField("場所", ""),
                  _textFormFieldNumberOnly("開始終了日時", ""),
                  _textFormField("タグ", ""),
                  _textFormFieldMultiLine("説明", ""),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.photo_library),
                          iconSize: 50,
                        ),
                        Button(
                            buttonText: '登録',
                            onPressed: () {
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                // SnackBar表示
                                SnackBar(
                                  content: Text("ユーザーを登録しました"),
                                ),
                              );
                            })
                      ])
                ])));
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
