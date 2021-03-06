import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/button.dart';
import './login.dart';

class LoginRequirePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('利用にはログインが必要です', style: TextStyle(fontSize: 20),),
          Padding(padding: EdgeInsets.all(20)),
          Button(buttonText: 'ログイン', onPressed: () {
            Get.to(LoginPage());
          })
        ]
      )
    );
  }
}