import 'package:flutter/material.dart';
import 'package:geoint/main.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => HomePage(),
                )
              );
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