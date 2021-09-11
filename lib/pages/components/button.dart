import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({required this.buttonText, required this.onPressed});

  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(
        primary: Colors.cyan,
        onPrimary: Colors.black,
        shape: StadiumBorder(),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
  
}