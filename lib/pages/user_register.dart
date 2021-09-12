import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:geoint/pages/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './components/auth_credentials.dart';
import './components/auth_service.dart';
import './components/button.dart';
import './edit_profile.dart';
import './verification.dart';

// Amplifiyとの通信関連
class RegisterRepository {
  Future<bool> register() {
    return Future.value(true);
  }
  // Future<bool> registerWithCredentials(SignUpCredentials credentials) async {
  //   try {
  //     final userAttributes = {'email': credentials.email};
  //     final result = await Amplify.Auth.signUp(username: credentials.email , password: credentials.password);
  //     print('AuthService#signUpWithCredentials is*NOT*SignUpComplete');
  //     this._credentials = credentials;
  //   }
  // }
}

class UserRegisterPage extends StatefulWidget {
  State<StatefulWidget> createState() => _UserRegisterPage();
}

class _UserRegisterPage extends State<UserRegisterPage> {
  final _authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  static const Color themeColor = Colors.cyan;
  String message = '';
  bool _showPassword = true;
  String email = '';
  dynamic password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ユーザー登録"),
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
                        hintText: 'メールアドレスを入力してください',
                      ),
                      validator: (String? value) {
                          if (value!.isEmpty) {
                            return '入力してください';
                          }
                      },
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _showPassword,
                      decoration: InputDecoration(
                        labelText: 'パスワード',
                        hintText: 'パスワードを入力してください',
                        suffixIcon: IconButton(
                            icon: Icon(_showPassword
                                ? FontAwesomeIcons.solidEye
                                : FontAwesomeIcons
                                    .solidEyeSlash), // パスワード表示状態を監視したい T _ T
                            onPressed: () {
                              // パスワード表示・非常時をトグル
                              this.setState(() {
                                _showPassword = !_showPassword;
                              });
                            }),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return '入力してください';
                        }
                      },
                    ),
                    Button(
                      buttonText: "次へ", 
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          email = _emailController.text.trim();
                          password = _passwordController.text.trim();
                          print('email: $email');
                          print('password: $password');
                          final credentials = SignUpCredentials(
                            email: email,
                            password: password,
                          );
                          if (_authService.signUpWithCredentials(credentials)) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => verificationPage()
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              // SnackBar表示
                              SnackBar(
                                content: Text('E-mailに認証コードを送信しました。'),
                              ),
                            );
                          } else {
                            print('ユーザ登録失敗');
                          }
                        }
                      },
                    )
                  ],
                ),
              )
            )
      ),
    );
  }
}
