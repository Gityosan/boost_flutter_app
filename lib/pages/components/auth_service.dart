import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

import './auth_credentials.dart';

enum AuthFlowStatus {
  login,
  register,
  session,
  verification,
}

class AuthState {
  final AuthFlowStatus authFlowStatus;

  AuthState({required this.authFlowStatus});
}

class AuthService {
  final authStateController = StreamController<AuthState>();

  void showRegister() {
    final state = AuthState(authFlowStatus: AuthFlowStatus.register);
    authStateController.add(state);
  }

  Future<bool> signUpWithCredentials(SignUpCredentials credentials) async {
    try {
      final result = await Amplify.Auth.signUp(
          username: credentials.email, password: credentials.password);
      print('AuthService#signUpWithCredentials is*NOT*SignUpComplete');
      final state = AuthState(authFlowStatus: AuthFlowStatus.verification);
      authStateController.add(state);
      return true;
    } on AuthException catch (e) {
      print('register error ... ${e.message}');
      return false;
    }
  }

  Future<bool> verifyCode(String verificationCode, String email) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
          username: email, confirmationCode: verificationCode);

      if (result.isSignUpComplete) {
        return true;
      } else {
        print('You are crazy');
        return false;
      }
    } on AuthException catch (e) {
      print('Could not verify code - ${e.message}');
      return false;
    }
  }

  Future<bool> loginWithCredentials(AuthCredentials credentials) async {
    try {
      final result = await Amplify.Auth.signIn(
          username: credentials.email, password: credentials.password);

      if (result.isSignedIn) {
        final state = AuthState(authFlowStatus: AuthFlowStatus.session);
        authStateController.add(state);
        return true;
      } else {
        print('User could not be signed in');
        return false;
      }
    } on AuthException catch (e) {
      print('Could not login - ${e.message}');
      return false;
    }
  }

  Future<String> checkAuthStatus() async {
    try {
      await Amplify.Auth.fetchAuthSession();

      final state = AuthState(authFlowStatus: AuthFlowStatus.session);
      authStateController.add(state);
      return state.authFlowStatus.toString();
    } catch (_) {
      final state = AuthState(authFlowStatus: AuthFlowStatus.login);
      authStateController.add(state);
      return state.authFlowStatus.toString();
    }
  }
}
