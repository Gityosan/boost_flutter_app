import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './edit_profile.dart';
import 'components/button.dart';

// Amplifiyとの通信関連
class RegisterRepository {
  Future<bool> register() {
    // ユーザ登録関連
    return Future.value(true);
  }
}

class UserRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterModel(
        RegisterRepository(),
      ),
      child: _UserRegisterPage(),
    );
  }
}

class RegisterModel extends ChangeNotifier {
  final RegisterRepository repository;
  String id = '';
  String password = '';
  String message = '';
  bool showPassword = false;

  RegisterModel(this.repository);

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

  Future<bool> register() async {
    print('id: $id, password: $password');
    var results = await repository.register();
    return results;
  }
}

class _UserRegisterPage extends StatelessWidget {
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
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'メールアドレス',
                        hintText: 'メールアドレスを入力してください',
                      ),
                      validator: context
                          .read<RegisterModel>()
                          .emptyValidator, // 入力チェックするらしい
                      onSaved: (value) => context.read<RegisterModel>().id =
                          value!, // save() 時に同期
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    TextFormField(
                      obscureText: !context.watch<RegisterModel>().showPassword,
                      decoration: InputDecoration(
                        labelText: 'パスワード',
                        hintText: 'パスワードを入力してください',
                        suffixIcon: IconButton(
                          icon: Icon(context.watch<RegisterModel>().showPassword
                              ? FontAwesomeIcons.solidEye
                              : FontAwesomeIcons
                                  .solidEyeSlash), // パスワード表示状態を監視したい T _ T (watch)
                          onPressed: () => context
                              .read<RegisterModel>()
                              .togglePasswordVisible(), // パスワード表示・非常時をトグル
                        ),
                      ),
                      validator: context
                          .read<RegisterModel>()
                          .emptyValidator, // 入力チェック
                    ),
                    Container(
                      // エラー文表示エリア
                      margin: EdgeInsets.fromLTRB(0, 16, 0, 8),
                      child: Text(
                        context.watch<RegisterModel>().message,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Button(buttonText: "次へ", onPressed: () async {
                      // 登録ボタンアクション
                      context.read<RegisterModel>().setMessage('');
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save(); // フォームの値の同期
                        var response = await context
                            .read<RegisterModel>()
                            .register();
                        print('register response = $response');
                        ScaffoldMessenger.of(context).showSnackBar(
                          // SnackBar表示
                          SnackBar(
                            content: Text('プロフィールを登録してください。'),
                          ),
                        );
                        Navigator.of(context).pop();
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditProfilePage(
                              isEdit: false,
                              userName: "", 
                              userGrade: 0, 
                              userTag: "", 
                              userIntroduction: ""),
                          ),
                        );
                      }
                    })
                  ],
                ),
              ))),
    );
  }
}
