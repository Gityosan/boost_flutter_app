import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

import 'package:flutter/material.dart';
import 'package:geoint/pages/login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './components/auth_credentials.dart';
import './edit_profile.dart';

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

class RegisterModel extends ChangeNotifier {
  final RegisterRepository repository;
  String email = '';
  String password = '';
  String message = '';
  bool showPassword = false; //パスワードを平文で表示する

  RegisterModel(this.repository);

  void setMessage(String value) {
    //エラーメッセージ設定
    message = value;
    notifyListeners();
  }

  void togglePasswordVisible() {
    //パスワード表示切り替え
    showPassword = !showPassword;
    notifyListeners();
  }

  String? emptyValidator(String? value) {
    //必須入力チェック
    if (value == null || value.isEmpty) {
      return '入力してください';
    }
    return null;
  }

  // Future<bool> auth() async {
  //   print("email: $email, password: $password");
  //   var results = await repository.();
  //   return results;
  // }
}

class _UserRegisterPage extends State<UserRegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  static const Color themeColor = Colors.cyan;
  String message = '';
  bool _showPassword = true;
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

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
                        }),
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
                    // Container(
                    //   // エラー文表示エリア
                    //   margin: EdgeInsets.fromLTRB(0, 16, 0, 8),
                    //   child: Text(
                    //     context.watch<RegisterModel>().message,
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       color: Colors.red,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => EditProfilePage()),
                              );
                            }
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
