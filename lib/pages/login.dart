import 'dart:ui';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:geoint/main.dart';
import './map.dart';

const users = const {
  'aaaa': 'aaaa',
  'iiii': 'iiii',
};

class AuthRepository {
  Future<bool> auth() {
    // 認証関連を明日作る (パスワードエラーとか)
    return Future.value(true);
  }
}

class LoginModel extends ChangeNotifier {
  final AuthRepository repository;
  String id = '';
  String password = '';
  String message = '';
  bool showPassword = false;

  LoginModel(this.repository);

  // エラーメッセージの設定
  void setMessage(String value) {
    message = value;
    notifyListeners();
  }

  // パスワードの表示切り替え
  void togglePasswordVisible() {
    showPassword = !showPassword;
    notifyListeners();
  }

  // パスワードの必須入力
  String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return '入力してください';
    }
    return null;
  }

  Future<bool> auth() async {
    print('id: $id, password: $password');
    var results = await repository.auth();
    return results;
  }
}


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginModel(
        AuthRepository(),
      ),
      child: LoginApp(),
    );
  }
}

class LoginApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'E-mailを入力してください',
                  ),
                  validator:
                      context.read<LoginModel>().emptyValidator, // 入力チェックするらしい
                  onSaved: (value) =>
                      context.read<LoginModel>().id = value!, // save() 時に同期
                ),
                TextFormField(
                  obscureText: !context.watch<LoginModel>().showPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'パスワードを入力してください',
                    suffixIcon: IconButton(
                      icon: Icon(context.watch<LoginModel>().showPassword
                          ? FontAwesomeIcons.solidEye
                          : FontAwesomeIcons
                              .solidEyeSlash), // パスワード表示状態を監視したい T _ T (watch)
                      onPressed: () => context
                          .read<LoginModel>()
                          .togglePasswordVisible(), // パスワード表示・非常時をトグル
                    ),
                  ),
                  validator:
                      context.read<LoginModel>().emptyValidator, // 入力チェック
                ),
                Container(
                  // エラー文表示エリア
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 8),
                  child: Text(
                    context.watch<LoginModel>().message,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        // ログインボタンアクション
                        context.read<LoginModel>().setMessage('');
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save(); //フォームの値の同期
                          var response =
                              await context.read<LoginModel>().auth();
                          print('auth response = $response');
                          // 本来はこちら
                          if (response) {
                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              // SnackBar表示
                              SnackBar(
                                content: Text('ログインしました'),
                              ),
                            );
                          } else {
                            context
                                .read<LoginModel>()
                                .setMessage('パスワードが誤っています'); // エラーメッセージセット
                          }
                        }
                      },
                      child: const Text('ログイン'),
                    ),
                  ),
                ),
              ],
            ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
              Navigator.of(context).pop();
            }, 
          icon: Icon(Icons.arrow_back)
          ),
        ),
      ),
    );
  }
}
