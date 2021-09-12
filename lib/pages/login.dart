import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import './user_register.dart';
import './components/auth_credentials.dart';
import './components/auth_service.dart';
import './components/button.dart';

const users = const {
  'aaaa': 'aaaa',
  'iiii': 'iiii',
};

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
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String message = '';
  bool _showPassword = false;
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ログイン"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back)
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                emailTextFormField(context),
                Padding(padding: EdgeInsets.all(10)),
                passwordTextFormField(context),
                Padding(padding: EdgeInsets.all(20)),
                loginButton(context),
                Padding(padding: EdgeInsets.all(20)),
                userRegistrationButton(context)
              ],
            ),
          )
        )
      ),
    );
  }
  
  Widget emailTextFormField(context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'メールアドレス',
        hintText: 'メールアドレスを入力してください',
      ),
      controller: _emailController,
      validator: (String? value) {
        if (value!.isEmpty) {
          return '入力してください';
        }
      },
    );
  }

  Widget passwordTextFormField(context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_showPassword,
      decoration: InputDecoration(
        labelText: 'パスワード',
        hintText: 'パスワードを入力してください',
        suffixIcon: IconButton(
          icon: Icon(_showPassword
              ? FontAwesomeIcons.solidEye
              : FontAwesomeIcons.solidEyeSlash), 
              // パスワード表示状態を監視したい T _ T (watch)
          onPressed: () {
            // パスワード表示・非常時をトグル
            this.setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return '入力してください';
        }
      }
    );
  }

  Widget loginButton(context) {
    return Button(
      buttonText: "ログイン", 
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
          _authService
            .loginWithCredentials(credentials)
            .then((value) => {
              if(value) {
                Navigator.of(context).pop(),
                ScaffoldMessenger.of(context).showSnackBar(
                  // SnackBar表示
                  SnackBar(
                    content: Text('ログインしました'),
                  ),
                )
              } else {
                print('ログインに失敗しました。')
              }
            });
        }
      }
    );
  }

  Widget userRegistrationButton(context) {
    return Button(buttonText: "ユーザー登録", onPressed: () async {
      // ユーザ登録アクション
      // ボタンを押下するとユーザ登録画面に遷移
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => UserRegisterPage(),
        ),
      );
    });
  }
}
