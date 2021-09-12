import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import './user_register.dart';
import './components/auth_credentials.dart';
import './components/auth_service.dart';

// Amplifiyとの通信関連
class AuthRepository {
  Future<bool> auth() {
    // 認証関連を明日作る (パスワードエラーとか)
    return Future.value(true);
  }

  Future<bool> loginWithCredentials(AuthCredentials credentials) async {
    try {
      final result = await Amplify.Auth.signIn(
          username: credentials.email, password: credentials.password);
      if (result.isSignedIn) {
        print('user login');
        return Future.value(true);
      } else {
        print('not found user');
        return Future.value(false);
      }
    } on AuthException catch (e) {
      print('could not login - ${e.message}');
      return Future.value(false);
    }
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String message = '';
  bool _showPassword = true;
  String email = '';
  String password = '';
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
                      decoration: const InputDecoration(
                        labelText: 'メールアドレス',
                        hintText: 'メールアドレスを入力してください',
                      ),
                      controller: _emailController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return '入力してください';
                        }
                      },
                    ),
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
                        }),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              email = _emailController.text.trim();
                              password = _passwordController.text.trim();
                              print('email: $email');
                              print('password: $password');
                              final credentials = LoginCredentials(
                                email: email,
                                password: password,
                              );
                              if (_authService
                                      .loginWithCredentials(credentials) ==
                                  true) {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  // SnackBar表示
                                  SnackBar(
                                    content: Text('ログインしました'),
                                  ),
                                );
                              } else {
                                print('ログインに失敗しました。');
                              }
                            }
                          },
                          child: const Text('ログイン'),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => UserRegisterPage()),
                            );
                          },
                          child: const Text('ユーザ登録'),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
