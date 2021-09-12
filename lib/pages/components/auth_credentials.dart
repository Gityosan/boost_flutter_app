abstract class AuthCredentials {
  final String email;
  final String password;

  AuthCredentials({required this.email, required this.password});
}

class LoginCredentials extends AuthCredentials {
  LoginCredentials({required String email, required String password})
      : super(email: email, password: password);
}

class SignUpCredentials extends AuthCredentials {
  SignUpCredentials({required String email, required String password})
      : super(email: email, password: password);
}
