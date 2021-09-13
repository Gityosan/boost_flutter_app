import 'package:flutter/material.dart';
import 'package:geoint/pages/edit_profile.dart';
import 'package:get/get.dart';

import './components/auth_credentials.dart';
import 'components/auth_service.dart';
import 'components/button.dart';

class VerificationPage extends StatefulWidget {
  VerificationPage({required this.credentials});
  final SignUpCredentials credentials;

  @override
  State<StatefulWidget> createState() => _VerificationPageState(credentials: credentials);
}

class _VerificationPageState extends State<VerificationPage> {
  _VerificationPageState({required this.credentials});
  final SignUpCredentials credentials;

  final _authService = AuthService();
  final _emailController = TextEditingController();
  final _verificatinController = TextEditingController();
  String message = '';
  String verification = '';
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
              icon: Icon(Icons.arrow_back)),
        ),
        body: Container(
            padding: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verificationFormField(),
                  Padding(padding: EdgeInsets.all(20)),
                  verificationButton()
                ],
              ),
            )));
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
        });
  }

  Widget verificationButton() {
    return Button(
      buttonText: '認証',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          verification = _verificatinController.text.trim();
          print('email: ${credentials.email}');
          print('verification: $verification');

          showLoadingDialog();
          _authService
            .verifyCode(verification, credentials.email)
            .then((value) => {
              if (value) {
                _authService
                  .loginWithCredentials(credentials)
                  .then((value) => {
                    Get.back(),
                    Get.to(EditProfilePage(
                      isEdit: false,
                      userName: "",
                      userGrade: 0,
                      userTag: "",
                      userIntroduction: "")),
                    ScaffoldMessenger.of(context).showSnackBar(
                      // SnackBar表示
                      SnackBar(
                        content: Text('認証に成功しました'),
                      ),
                    )
                  })
                
              } else {
                Get.back(),
                ScaffoldMessenger.of(context).showSnackBar(
                  // SnackBar表示
                  SnackBar(
                    content: Text('認証に失敗しました'),
                  ),
                )
              }
            }
          );
        }
      },
    );
  }

  Future showLoadingDialog() {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 250), // ダイアログフェードインmsec
      barrierColor: Colors.black.withOpacity(0.5), // 画面マスクの透明度
      pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}
