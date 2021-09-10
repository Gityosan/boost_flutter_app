import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
              Navigator.of(context).pop();
            }, 
          icon: Icon(Icons.arrow_back)
          ),
        title: Text("ログイン"),
      ),
      body: Material(
        child: Center(
          child: Text("Login Page"),
        )
      )
    );
  }
}