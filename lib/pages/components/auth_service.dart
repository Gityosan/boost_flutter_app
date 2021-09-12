import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

import './auth_credentials.dart';

enum AuthFlowStatus {
  login,
  register,
  session,
}
