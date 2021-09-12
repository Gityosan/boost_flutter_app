import 'package:flutter/material.dart';

import 'components/auth_service.dart';
import 'components/button.dart';

class VerificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final _authService = AuthService();
  final _emailController = TextEditingController();
  final _verificatinController = TextEditingController();
  String message = '';
  String verification = '';
  String email = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              emailTextFormField(),
              Padding(padding: EdgeInsets.all(10)),
              verificationFormField(),
              Padding(padding: EdgeInsets.all(20)),
              verificationButton()
            ],
          ),
        ))
    );
  }

  Widget emailTextFormField() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'メールアドレス',
        hintText: 'メールアドレス',
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return '入力してください';
        }
      }
    );
  }

  Widget verificationFormField() {
    return TextFormField(
      controller: _verificatinController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: '認証コード',
        hintText: '認証コードを入力してください',
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return '入力してください';
        }
      }
    );
  }

  Widget verificationButton() {
    return Button(
      buttonText: '認証',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          email = _emailController.text.trim();
          verification = _verificatinController.text.trim();
          print('email: $email');
          print('verification: $verification');

          _authService
            .verifyCode(verification, email)
            .then((value) => {
              if (value) {
                Navigator.of(context).pop(),
                ScaffoldMessenger.of(context).showSnackBar(
                  // SnackBar表示
                  SnackBar(
                    content: Text('認証に成功しました'),
                  ),
                )
              } else {
                print('認証に失敗')
              }
            });
        }
      },
    );
  }
}
