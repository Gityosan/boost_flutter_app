import 'dart:async';
import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
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

class CreateUserImage {
  final RxString userImageId;

  CreateUserImage({required this.userImageId});
}

class ListUser {
  final List<String> items;
  var listUsers;

  ListUser(this.items);
}

class AuthService {
  final authStateController = StreamController<AuthState>();
  AuthController authController = Get.find();

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
        // -------------------------------
        // ownerとidentityId取得
        await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true),
        ).then((AuthSession value) => {
              authController.setIdentityId((value as CognitoAuthSession).identityId!),
              print((value).identityId!),
            });

        await Amplify.Auth.getCurrentUser().then((AuthUser value) => {
              authController.setOwner(value.username),
              print(value.username),
            });

        //初回かどうか判定します
        String listUsersQuery =
            '''query ListUsers(\$filter: ModelUserFilterInput) {
          listUsers(filter: \$filter) {
            items {
              userId
              name
              introduction
              lat
              lng
              tag
              acquaintance {
                userId
                name
                introduction
                lat
                lng
                tag
                status
              }
              icon {
                userImageId
                name
                type
                size
                alt
                url
                identityId
              }
              status
              event {
                eventId
                userId
                name
                introduction
                tag
                lat
                lng
                limit
                reserved
                start
                end
                from
                to
                reported
              }
              owner
            }
          }
        }''';

        var operation = Amplify.API.query(
            request:
                GraphQLRequest<String>(document: listUsersQuery, variables: {
          'filter': {
            'owner': {'eq': authController.owner.value}
          }
        }));

        var response = await operation.response;
        print(response.errors);
        var data = response.data;

        if (data == null) {
          // dataがなければ、初回なので新規作成する
          String createUserImageQuery = '''mutation CreateUserImage(
            \$input: CreateUserImageInput!
            \$condition: ModelUserImageConditionInput
          ) {
            createUserImage(input: \$input, condition: \$condition) {
              userImageId
            }
          } ''';
          var createUserImageOperation = Amplify.API.mutate(
              request: GraphQLRequest<String>(
                  document: createUserImageQuery,
                  variables: {
                'input': {
                  'identityId': authController.identityId,
                  'owner': authController.owner,
                }
              }));

          var createUserImageResponse = await createUserImageOperation.response;
          var createUserImageData =
              createUserImageResponse.data as CreateUserImage;

          String createUserQuery = ''' mutation CreateUser(
            \$input: CreateUserInput!
            \$condition: ModelUserConditionInput
          ) {
            createUser(input: \$input, condition: \$condition) {
              userId
              name
            }
          }''';

          var createUserOperation = Amplify.API.mutate(
              request:
                  GraphQLRequest<String>(document: createUserQuery, variables: {
            'input': {
              'userImageId': createUserImageData.userImageId,
              'status': 'everyone',
              'identityId': authController.identityId,
              'owner': authController.owner,
            }
          }));

          var createUserResponse = await createUserOperation.response;
          var createUserData = json.decode(createUserResponse.data);
          authController.setUserInfo(createUserData);
        } else {
          // 初回じゃなければ普通にUserテーブル取得する
          String listUsersQuery = '''query ListUsers(
            \$userId: ID
            \$filter: ModelUserFilterInput
            \$limit: Int
            \$nextToken: String
            \$sortDirection: ModelSortDirection
          ) {
            listUsers(
              userId: \$userId
              filter: \$filter
              limit: \$limit
              nextToken: \$nextToken
              sortDirection: \$sortDirection
            ) {
              items {
                userId
                name
                introduction
                lat
                lng
                tag
                acquaintance 
                icon {
                  userImageId
                  name
                  type
                  size
                  alt
                  url
                  identityId
                  owner
                }
                status
                event {
                  items{
                    eventId
                    userId
                    name
                    introduction
                    tag
                    lat
                    lng
                    limit
                    reserved
                    start
                    end
                    from
                    to
                    reported
                  }
                }
                owner
              }
            }
          }''';

          var listUsersOperation = Amplify.API.query(
              request:
                  GraphQLRequest<String>(document: listUsersQuery, variables: {
            'filter': {
              'owner': {'eq':authController.owner.value},
            }
          }));

          var listUsersResponse = await listUsersOperation.response;
          print(listUsersResponse.errors);
          var listUsersData = json.decode(listUsersResponse.data);
          print(listUsersData);
          authController.setUserInfo(listUsersData['listUsers']);

        }
        // ----------------------------
        
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isAuth', true);

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

  Future<void> logOut() async {
    try {
      await Amplify.Auth.signOut();    

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isAuth', false);

      authController.setIdentityId('');
      authController.setOwner('');
      
      print('ログアウトOK');
    } on AuthException catch (authError) {
      print('一生ログアウトできないアカウントです');
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
