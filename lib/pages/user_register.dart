import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import './components/auth_credentials.dart';
import './components/auth_service.dart';
import './components/button.dart';
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
  @override
  State<StatefulWidget> createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  final _authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String message = '';
  bool _showPassword = false;
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
            Get.back();
          },
          icon: Icon(Icons.arrow_back)
        ),
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
              passwordTextFormField(),
              Padding(padding: EdgeInsets.all(20)),
              nextButton()
            ],
          ),
        )
      ),
    );
  }

  Widget emailTextFormField() {
    return TextFormField(
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
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_showPassword,
      decoration: InputDecoration(
        labelText: 'パスワード',
        hintText: 'パスワードを入力してください',
        helperText: '8文字以上、大文字・小文字・数字必須',
        suffixIcon: IconButton(
          icon: Icon(
            _showPassword
              ? FontAwesomeIcons.solidEye
              : FontAwesomeIcons.solidEyeSlash),
          // パスワード表示状態を監視したい T _ T
          onPressed: () {
            // パスワード表示・非常時をトグル
            this.setState(() {
              _showPassword = !_showPassword;
            });
          }
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return '入力してください';
        }
      },
    );
  }

  Widget nextButton() {
    return Button(
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

          _authService
            .signUpWithCredentials(credentials)
            .then((value) => {
              if (value) {
                Get.to(VerificationPage()),
                ScaffoldMessenger.of(context).showSnackBar(
                  // SnackBar表示
                  SnackBar(
                    content: Text('E-mailに認証コードを送信しました。'),
                  ),
                )
              } else {
                print('ユーザ登録失敗')
              }
            }
          );
        }
      },
    );
  }
}
