import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({required this.buttonText, required this.onPressed});

  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Text(buttonText, style: TextStyle( fontSize: 20 )),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.cyan,
        onPrimary: Colors.white,
        shape: StadiumBorder(),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}