import 'package:flutter/material.dart';
import './components/auth_credentials.dart';
import './components/auth_service.dart';

class verificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _verificationPage();
}

class _verificationPage extends State<verificationPage> {
  final _authService = AuthService();
  final _emailController = TextEditingController();
  final _verificatinController = TextEditingController();
  String message = '';
  String verification = '';
  String email = '';
  final _formKey = GlobalKey<FormState>();
  static const Color themeColor = Colors.cyan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
          child: Container(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'メールアドレス',
                          hintText: 'メールアドレス',
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return '入力してください';
                          }
                        }),
                    TextFormField(
                        controller: _verificatinController,
                        decoration: InputDecoration(
                          labelText: '認証コード',
                          hintText: '認証コードを入力してください',
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return '入力してください';
                          }
                        }),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              email = _emailController.text.trim();
                              verification = _verificatinController.text.trim();
                              print('email: $email');
                              print('verification: $verification');
                              if (_authService.verifyCode(
                                      verification, email) ==
                                  true) {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  // SnackBar表示
                                  SnackBar(
                                    content: Text('認証に成功しました'),
                                  ),
                                );
                              } else {
                                print('認証に失敗');
                              }
                            }
                          },
                          child: const Text('認証'),
                        ),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
